FactoryBot.define do
  factory :academic_calendar do
    year { Faker::Number.number(2) }
    organization
  end
end
