class ProgramSerializer < AbstractSerializer
  attributes :date, :done, :class_number, :topics_count, :title, :description, :picture_url

  has_many :topics, serializer: ::TopicSerializer
end