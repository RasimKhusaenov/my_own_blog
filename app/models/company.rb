class Company < ApplicationRecord
  extend FriendlyId
  friendly_id :official_name, use: :slugged

  has_many :company_members, dependent: :destroy
  has_many :articles, dependent: :nullify

  validates :official_name, presence: true, uniqueness: true
  validates :unofficial_name, uniqueness: true, allow_blank: true
end
