FactoryBot.define do
  factory :exam do
    title { Faker::Name.name }
    subject
  end
end
