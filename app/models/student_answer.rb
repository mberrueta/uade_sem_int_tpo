class StudentAnswer < ApplicationRecord
  belongs_to :student_exam
  belongs_to :exam_question

  validate :valid_option

  def correct
    answer == exam_question&.options&.first
  end

  private

  def valid_option
    errors.add(:base, "'#{answer}' is not a valid option. Check valid options in the exam") unless exam_question&.options.include?(answer)
  end
end
