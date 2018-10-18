class StudentExamSerializer < AbstractSerializer
  belongs_to :exam
  has_many :student_answers
  has_many :student_exam_qualifications
end
