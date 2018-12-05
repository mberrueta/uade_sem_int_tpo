class StudentExam < ApplicationRecord
  belongs_to :exam
  belongs_to :student
  has_many :student_answers, dependent: :destroy
  has_one :student_exam_qualification, dependent: :destroy

  delegate :exam_questions, to: :exam
  after_create :create_exam_qualification

  def calculated_score
    return nil unless exam_questions.any?

    score = (student_answers.reload.count(&:correct?).to_f / exam_questions.count).round(2) * 10
    student_exam_qualification.update!(score: score)
  end

  private

  def create_exam_qualification
    self.student_exam_qualification = StudentExamQualification.new(student_exam: self)
    self.student_exam_qualification.save
  end
end
