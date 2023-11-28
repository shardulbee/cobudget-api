# typed: false
# This will guess the User class
FactoryBot.define do
  factory :account do
    institution
    remote_id { 'account_123' }
    name { 'fun checking acct' }
    official_name { 'official fun checking account' }
    account_type { PlaidAdaptor::AccountType::Checking.serialize }
    balance { Money.new(100, 'USD') }
    mask { '123' }
  end
end
