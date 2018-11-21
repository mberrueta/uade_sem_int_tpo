class ExamSerializer < AbstractSerializer
  attributes :title, :enabled
  has_one :lesson
end