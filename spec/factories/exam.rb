FactoryBot.define do
  factory :exam do
    title { Faker::Name.name }
    lesson
  end
end
