# typed: ignore

require "test_helper"

class PlaidAdaptorTest < ActiveSupport::TestCase
  def test_create_link_token
    use_vcr do
      link_token = PlaidAdaptor::Client.new.create_link_token(id: 1)

      assert_match /link-sandbox-[a-z0-9\-]+$/, link_token
    end
  end

  def test_token_exchange
    use_vcr do
      institution = PlaidAdaptor::Client.new.exchange(public_token: sandbox_public_token_create)

      assert_match /access-sandbox-[a-z0-9\-]+$/, institution.access_token
      refute_nil institution.item_id
    end
  end

  def test_fetch_accounts
    use_vcr do
      access_token = sandbox_access_token_create
      actual_accounts = PlaidAdaptor::Client.new.fetch_accounts(access_token: access_token)
      expected_accounts = plaid_client.accounts_get(Plaid::AccountsGetRequest.new(access_token: access_token))
        .accounts
        .select { |account| PlaidAdaptor::AccountType.values.map(&:serialize).include?(account.subtype) }

      assert_equal actual_accounts.length, expected_accounts.length
    end
  end

  def test_fetch_transactions
    use_vcr do |cass|
      access_token = sandbox_access_token_create
      account_id = T.must(PlaidAdaptor::Client.new.fetch_accounts(access_token: access_token).first).id

      if cass.recording?
        # need to sleep to wait for plaid to fetch all the transactions
        sleep(10)
      end

      actual_transactions = PlaidAdaptor::Client.new.fetch_transactions(
        access_token: access_token,
        account_id: account_id,
        start_date: Date.today - 30.days,
        end_date: Date.today
      )
      expected_transactions = plaid_client.transactions_get(Plaid::TransactionsGetRequest.new(
        access_token: access_token,
        start_date: Date.today - 30.days,
        end_date: Date.today,
        options: Plaid::TransactionsGetRequestOptions.new(account_ids: account_id)
      )).transactions

      assert_equal actual_transactions.length, expected_transactions.length
      actual_transactions.zip(expected_transactions).each do |actual_transaction, expected|
        expected_transaction = PlaidAdaptor::Transaction.new(
          id: expected.transaction_id,
          name: expected.name,
          amount: Money.new(expected.amount, expected.iso_currency_code),
          occurred_on: Date.strptime(expected.date, PlaidAdaptor::DATE_FORMAT)
        )

        assert_equal expected_transaction, actual_transaction
      end
    end
  end
end
