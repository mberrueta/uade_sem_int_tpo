FactoryBot.define do
  factory :feedback do
    student
    value { Faker::Number.between(1, 5) }
    comments { Faker::Lorem.sentence(3) }
    to { create(:teacher) }
  end
end
