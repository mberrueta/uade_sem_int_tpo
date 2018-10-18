class StudentExam < ApplicationRecord
  belongs_to :exam
  belongs_to :student
  has_many :student_answers, dependent: :destroy
  has_many :student_exam_qualifications, dependent: :destroy
end
