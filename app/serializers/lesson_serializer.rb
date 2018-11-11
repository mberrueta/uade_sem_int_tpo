class LessonSerializer < AbstractSerializer
  attributes :date, :done, :class_number, :topics_count, :title, :description, :picture_url

  has_many :topics, serializer: ::TopicSerializer
  has_one :teacher
  belongs_to :subject
end