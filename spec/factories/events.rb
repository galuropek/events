FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }

    trait :invalid do
      title { nil }
    end
  end
end
