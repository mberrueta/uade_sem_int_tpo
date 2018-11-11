FactoryBot.define do
  factory :student_answer do
    student_exam
    exam_question
    answer { exam_question.present? ? exam_question.options.sample : '' }
  end
end
