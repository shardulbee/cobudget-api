# typed: false

require "test_helper"

class AccountSyncJobTest < ActiveJob::TestCase
  def test_no_transactions_created
    account = create(:account)
    PlaidAdaptor::Client
      .any_instance
      .expects(:fetch_transactions)
      .with(
        access_token: account.institution.access_token,
        account_id: account.remote_id,
        start_date: Date.today - 45.days,
        end_date: Date.today
      )
      .returns([])

    assert_no_changes -> { Transaction.count } do
      AccountSyncJob.perform_now(account)
    end
  end

  def test_transaction_created
    account = create(:account)
    expected = PlaidAdaptor::Transaction.new(
      id: 'transaction-123',
      name: 'UBER',
      amount: Money.new(100, 'USD'),
      occurred_on: Date.today
    )
    PlaidAdaptor::Client
      .any_instance
      .expects(:fetch_transactions)
      .with(
        access_token: account.institution.access_token,
        account_id: account.remote_id,
        start_date: Date.today - 45.days,
        end_date: Date.today
      )
      .returns([expected])

    assert_changes -> { Transaction.count }, from: 0, to: 1 do
      AccountSyncJob.perform_now(account)
    end
    actual = Transaction.last

    assert_equal expected.id, actual.remote_id
    assert_equal expected.name, actual.name
    assert_equal expected.amount, actual.amount
    assert_equal expected.occurred_on, actual.occurred_on
    assert_equal account, actual.account
  end

  def test_no_transactions_created_if_exists
    transaction = create(:transaction)
    PlaidAdaptor::Client
      .any_instance
      .expects(:fetch_transactions)
      .with(
        access_token: transaction.account.institution.access_token,
        account_id: transaction.account.remote_id,
        start_date: Date.today - 45.days,
        end_date: Date.today
      )
      .returns([PlaidAdaptor::Transaction.new(
        id: transaction.remote_id,
        name: transaction.name,
        amount: transaction.amount,
        occurred_on: transaction.occurred_on,
      )])

    assert_no_changes -> { Transaction.count } do
      AccountSyncJob.perform_now(transaction.account)
    end
  end

end
