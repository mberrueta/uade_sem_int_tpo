class SubjectSerializer < AbstractSerializer
  attributes :name, :day, :hour, :code

  has_many :lessons
  belongs_to :teacher
  belongs_to :course
end