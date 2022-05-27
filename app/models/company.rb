class Company < ApplicationRecord
  extend Enumerize

  has_many :company_members, dependent: :destroy
  has_many :articles, dependent: :nullify
end
