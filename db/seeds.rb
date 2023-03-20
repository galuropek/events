5.times do
  Room.create(title: Faker::Company.name, description: Faker::Company.catch_phrase)
end

5.times do
  Event.create(title: Faker::Movie.title, description: Faker::Movie.quote)
end
