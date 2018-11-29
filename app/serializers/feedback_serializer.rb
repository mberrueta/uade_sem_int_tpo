class FeedbackSerializer < AbstractSerializer
  attributes :value, :comments, :viewed, :to_type

  belongs_to :to
  belongs_to :student
end