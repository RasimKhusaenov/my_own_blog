FactoryBot.define do
  factory :comment do
    content { Faker::Books::Dune.quote }
    article
    user
  end
end
