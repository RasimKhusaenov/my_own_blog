FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { "12345" }

    trait :superadmin do
      role { :superadmin }
    end

    trait :admin do
      role { :admin }
    end

    trait :reader do
      role { :reader }
    end
  end
end
