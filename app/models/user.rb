class User < ApplicationRecord
  extend Enumerize

  TOKEN_EXPIRATION_TIME = 15.minutes

  has_many :company_members, dependent: :destroy
  has_many :articles, dependent: :nullify

  has_secure_password

  enumerize :role, in: %i[reader admin superadmin], scope: :shallow, predicates: true

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :role, presence: true

  def administrative_role?
    admin? || superadmin?
  end

  def valid_password?(password)
    authenticate(password)
  end
end
