class Company < ApplicationRecord
  has_many :company_members, dependent: :destroy
  has_many :articles, dependent: :nullify

  validates :official_name, presence: true
end
