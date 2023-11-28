# typed: false
# This will guess the User class
FactoryBot.define do
  factory :institution do
    item_id { 'item-sandbox-123' }
    access_token { 'access-token-123' }
    user
  end
end
