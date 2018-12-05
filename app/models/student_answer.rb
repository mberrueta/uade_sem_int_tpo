class StudentAnswer < ApplicationRecord
  belongs_to :student_exam
  belongs_to :exam_question

  after_save :update_qualification

  def correct
    answer == exam_question&.options&.first
  end
  alias correct? correct

  private

  def update_qualification
    student_exam.calculated_score
  end
end
