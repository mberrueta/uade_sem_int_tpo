class SubjectSerializer < AbstractSerializer
  attributes :name, :day, :hour, :code

  has_many :programs
end