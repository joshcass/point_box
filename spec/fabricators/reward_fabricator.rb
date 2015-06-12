Fabricator(:reward) do
  title Faker::Lorem.word
  description Faker::Lorem.paragraph
  cost Faker::Number.number(2)
end
