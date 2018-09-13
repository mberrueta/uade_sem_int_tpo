FactoryBot.define do
  factory :course do
    name { Faker::Name.name }
    academic_calendar
  end
end
