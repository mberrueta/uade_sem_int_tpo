FactoryBot.define do
  factory :exam_question do
    question { Faker::Name.name }
    options { Array.new(4) { Faker::Name.name } }
    exam
  end
end
