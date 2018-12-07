class StudentExamSerializer < AbstractSerializer
  belongs_to :exam, serializer: ::ExamSerializer
  has_many :student_answers, serializer: ::StudentAnswerSerializer
  has_one :student_exam_qualification
  belongs_to :student
end
