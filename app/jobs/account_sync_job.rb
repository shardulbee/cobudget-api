# typed: true
class AccountSyncJob < ApplicationJob
  extend(T::Sig)
  queue_as :default

  sig { params(account: Account).void }
  def perform(account)
    plaid_transactions = PlaidAdaptor::Client.new.fetch_transactions(
      access_token: T.must(T.must(account.institution).access_token),
      account_id: T.must(account.remote_id),
      start_date: Date.today - 45.days,
      end_date: Date.today
    )
    existing_transaction_ids = account.transactions.map(&:remote_id)
    new_transactions = plaid_transactions.reject do |plaid_transaction|
      existing_transaction_ids.include?(plaid_transaction.id)
    end.each do |transaction|
      Transaction.create(
        account: account,
        amount: transaction.amount,
        remote_id: transaction.id,
        name: transaction.name,
        occurred_on: transaction.occurred_on
      )
    end
  end
end
