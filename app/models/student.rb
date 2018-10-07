class Student < Person
  has_many :assists
  belongs_to :course
end