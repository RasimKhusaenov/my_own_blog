FactoryBot.define do
  factory :company_member do
    company
    user
    role { CompanyMember.role.values.sample }
  end
end
