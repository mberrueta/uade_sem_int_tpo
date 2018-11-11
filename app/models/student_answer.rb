class StudentAnswer < ApplicationRecord
  belongs_to :student_exam
  belongs_to :exam_question

  def correct
    answer == exam_question&.options&.first
  end
end
