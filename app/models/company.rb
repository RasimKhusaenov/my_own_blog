class Company < ApplicationRecord
  extend FriendlyId
  friendly_id :official_name, use: :slugged

  SUBDOMAIN_REGEXP = /\A(?!(http|https|www)\z)(\A[\w\-_]+)\z/

  has_many :company_members, dependent: :destroy
  has_many :articles, dependent: :nullify

  has_one :owner_relationship,
          -> { where(role: :owner) }, class_name: "CompanyMember", inverse_of: false, dependent: :destroy
  has_one :owner, through: :owner_relationship, class_name: "User", source: :user

  validates :official_name, presence: true, uniqueness: true
  validates :unofficial_name, uniqueness: true, allow_blank: true
end
