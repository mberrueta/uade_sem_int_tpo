class StudentExamSerializer < AbstractSerializer
  belongs_to :exam, serializer: ::ExamSerializer
  has_many :student_answers, serializer: ::StudentAnswerSerializer
  has_many :student_exam_qualifications
end
