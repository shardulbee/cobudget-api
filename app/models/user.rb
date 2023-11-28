# typed: strict
class User < ApplicationRecord
  has_secure_password

  has_many :institutions
  validates :email, :first_name, :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
