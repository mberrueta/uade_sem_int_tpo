FactoryBot.define do
  factory :topic do
    title { Faker::Name.name }
    program
  end
end
