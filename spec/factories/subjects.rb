FactoryBot.define do
  factory :subject do
    name { Faker::Name.name }
    course
  end
end
