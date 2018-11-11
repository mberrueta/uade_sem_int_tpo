FactoryBot.define do
  factory :topic do
    title { Faker::Name.name }
    lesson
    description { Faker::Lorem.sentence(3) }
  end
end
