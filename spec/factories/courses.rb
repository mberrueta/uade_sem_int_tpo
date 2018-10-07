FactoryBot.define do
  factory :course do
    name { Faker::Name.name }
    classroom { Faker::Name.name }
    shift { %w[morning evening night].sample }
    academic_calendar
    manager
  end
end
