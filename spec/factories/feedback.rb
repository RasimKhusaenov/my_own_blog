FactoryBot.define do
  factory :feedback do
    author { Faker::Name.first_name }
    email { Faker::Internet.email }
    message { Faker::Lorem.paragraph }
  end
end
