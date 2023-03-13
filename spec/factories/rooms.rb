FactoryBot.define do
  factory :room do
    title { 'MyString' }

    trait :invalid do
      title { nil }
    end
  end
end
