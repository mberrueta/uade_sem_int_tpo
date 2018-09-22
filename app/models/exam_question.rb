class ExamQuestion < ApplicationRecord
  validates :question, presence: true

  belongs_to :exam
end
