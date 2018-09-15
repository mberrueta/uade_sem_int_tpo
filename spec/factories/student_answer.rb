FactoryBot.define do
  factory :student_answer do
    name { Faker::Name.name }
  end

  # https://github.com/stympy/faker
  # Faker::Lorem.sentence word paragraph
  # Faker::Company.name profession logo
  # Faker::Boolean.boolean
  # Faker::Name.name
  # Faker::Number.decimal(2) between(1, 10)
  # Faker::Date.between(2.days.ago, Date.today)

end
