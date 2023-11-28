# typed: false
# This will guess the User class
FactoryBot.define do
  factory :transaction do
    account
    amount { Money.new(100, 'USD') }
    remote_id { 'transaction_123' }
    name { 'UBER' }
    occurred_on { Date.today }
  end
end