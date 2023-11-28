# typed: strict
class Account < ApplicationRecord
  money_column :balance, currency_column: :currency
  belongs_to :institution, required: true
  has_many :transactions
end
