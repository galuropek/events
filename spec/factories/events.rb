FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "Event ##{n} title" }
    sequence(:description) { |n| "Event ##{n} description" }

    trait :invalid do
      title { nil }
    end
  end
end
