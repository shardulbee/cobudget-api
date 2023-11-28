# typed: strict
class Transaction < ApplicationRecord
  belongs_to :account
  money_column :amount, currency_column: :currency
end
