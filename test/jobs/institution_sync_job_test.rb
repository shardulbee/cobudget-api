# typed: false
require "test_helper"

class InstitutionSyncJobTest < ActiveJob::TestCase
  def test_no_accounts_created
    institution = create(:institution)
    PlaidAdaptor::Client
      .any_instance
      .expects(:fetch_accounts)
      .with(access_token: institution.access_token)
      .returns([])

    assert_no_changes -> { Account.count } do
      InstitutionSyncJob.perform_now(institution)
      AccountSyncJob.expects(:perform_later).never
    end
  end

  def test_account_created
    institution = create(:institution)
    plaid_account = PlaidAdaptor::Account.new(
      id: 'account_123',
      name: 'fun checking acct',
      official_name: 'official fun checking account',
      type: PlaidAdaptor::AccountType::Checking,
      balance: Money.new(100, 'USD'),
      mask: '123'
    )
    PlaidAdaptor::Client
      .any_instance
      .expects(:fetch_accounts)
      .with(access_token: institution.access_token)
      .returns([plaid_account])

    AccountSyncJob.expects(:perform_later).with do |account|
      assert_equal plaid_account.name, account.name
      assert_equal plaid_account.id, account.remote_id
      assert_equal plaid_account.balance, account.balance
      assert_equal plaid_account.official_name, account.official_name
      assert_equal plaid_account.type, PlaidAdaptor::AccountType.deserialize(account.account_type)
      assert_equal plaid_account.mask, account.mask
      assert_equal institution, account.institution
    end
    assert_changes -> { Account.count }, from: 0, to: 1 do
      InstitutionSyncJob.perform_now(institution)
    end
  end
end
