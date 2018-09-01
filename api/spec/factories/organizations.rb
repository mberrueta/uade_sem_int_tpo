FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    page { Faker::Internet.url }
  end
end
