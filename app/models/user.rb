class User < ApplicationRecord
  extend Enumerize

  TOKEN_EXPIRATION_TIME = 15.minutes
  ROLES = %i[reader admin superadmin].freeze

  has_many :company_members, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :companies, through: :company_members

  has_one :owner_relationship,
          -> { where(role: :owner) }, class_name: "CompanyMember", inverse_of: false, dependent: :destroy
  has_one :own_company, through: :owner_relationship, class_name: "Company", source: :company

  has_secure_password

  enumerize :role, in: ROLES, scope: :shallow, predicates: true

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
