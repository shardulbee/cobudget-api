# typed: false
# This will guess the User class
FactoryBot.define do
  factory :user do
    email { 'test@email.com' }
    password { 'secure' }
    first_name { 'Rishav' }
    last_name { 'Baral' }
  end
end