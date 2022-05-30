FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    content { Faker::Books::Dune.quote }
    user

    trait :published do
      published { true }
    end
  end
end
