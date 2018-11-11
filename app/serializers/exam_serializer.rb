class ExamSerializer < AbstractSerializer
  belongs_to :title
  has_one :lesson
end