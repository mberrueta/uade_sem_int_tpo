class Exam < ApplicationRecord
  validates :title, presence: true

  belongs_to :lesson
  has_many :exam_questions, dependent: :destroy
  has_many :student_exams, dependent: :destroy

  delegate :subject, to: :lesson
end
