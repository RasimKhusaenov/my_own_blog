FactoryBot.define do
  factory :company_member do
    company
    user
    role { CompanyMember::ROLES.sample }
  end
end
