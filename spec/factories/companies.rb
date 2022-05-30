FactoryBot.define do
  factory :company do
    official_name { Faker::Company.name }
  end
end
