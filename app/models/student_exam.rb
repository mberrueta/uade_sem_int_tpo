class StudentExam < ApplicationRecord
  belongs_to :exam
  has_many :student_answers, dependent: :destroy
  has_many :student_exam_qualifications, dependent: :destroy
end
