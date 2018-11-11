class ExamSerializer < AbstractSerializer
  attributes :title
  has_one :lesson
end