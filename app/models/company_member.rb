class CompanyMember < ApplicationRecord
  extend Enumerize

  belongs_to :company
  belongs_to :user

  enumerize :role, in: %i[owner writer], scope: true

  validates :role, presence: true
  validates :user_id, uniqueness: { scope: :company_id }
end
