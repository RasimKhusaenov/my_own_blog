class CompanyMember < ApplicationRecord
  extend Enumerize

  ROLES = %i[owner writer].freeze

  belongs_to :company
  belongs_to :user

  enumerize :role, in: ROLES, scope: true

  validates :role, presence: true
  validates :user_id, uniqueness: { scope: :company_id }
end
