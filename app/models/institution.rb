# typed: strict
class Institution < ApplicationRecord
  belongs_to :user
  has_many :accounts
end
