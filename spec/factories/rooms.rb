FactoryBot.define do
  sequence(:title) { |n| "#{self} ##{n} title"}

  factory :room do
    title
  end
end
