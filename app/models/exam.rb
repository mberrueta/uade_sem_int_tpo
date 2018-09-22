class Exam < ApplicationRecord
  validates :title, presence: true

  belongs_to :subject
  has_many :exam_questions, dependent: :destroy
  has_many :student_exams, dependent: :destroy
end
