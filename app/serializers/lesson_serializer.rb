class LessonSerializer < AbstractSerializer
  attributes :date, :done, :class_number, :topics_count, :title, :description, :picture_url, :exam_enabled

  belongs_to :subject
  has_many :topics, serializer: ::TopicSerializer
  has_one :exam, serializer: ::ExamSerializer
  has_one :teacher
end