class ExamSerializer < AbstractSerializer
  attributes :title, :enabled
  has_one :lesson
  has_many :exam_questions
end