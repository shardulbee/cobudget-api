# typed: ignore

class InstitutionSyncJob < ApplicationJob
  extend(T::Sig)
  queue_as :default

  def perform(institution)
    PlaidAdaptor::Client.new
      .fetch_accounts(access_token: institution.access_token).each do |account|
        next if Account.find_by(remote_id: account.id)
        account = Account.create(
          name: account.name,
          remote_id: account.id,
          balance: account.balance,
          official_name: account.official_name,
          account_type: account.type.serialize,
          mask: account.mask,
          institution: institution,
        )
        AccountSyncJob.perform_later(account)
      end
  end
end
