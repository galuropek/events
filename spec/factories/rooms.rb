FactoryBot.define do
  factory :room do
    title { 'MyString' }
    description { 'MyText' }

    trait :invalid do
      title { nil }
    end
  end
end
