FactoryBot.define do
  factory :room do
    sequence(:title) { |n| "Room ##{n} title" }
    sequence(:description) { |n| "Room ##{n} description" }

    trait :invalid do
      title { nil }
    end
  end
end
