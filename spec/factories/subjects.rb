FactoryBot.define do
  factory :subject do
    name { Faker::Name.name }
    day { %w[monday tuesday wednesday thursday friday].sample }
    code { Faker::Number.between(100, 800) }
    hour { %w[9:00 10:00 12:00 14:00].sample }
    course
  end
end
