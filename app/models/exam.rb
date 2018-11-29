class Exam < ApplicationRecord
  validates :title, presence: true

  belongs_to :lesson
  has_many :exam_questions, dependent: :destroy
  has_many :student_exams, dependent: :destroy

  before_save :default_enabled

  delegate :subject, to: :lesson

  private

  def default_enabled
    self.enabled ||= false
  end
end
