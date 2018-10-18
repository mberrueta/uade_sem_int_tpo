FactoryBot.define do
  factory :student_exam do
    questions_to_show { Faker::Number.between(3, 9) }
    student
    exam
  end
end
