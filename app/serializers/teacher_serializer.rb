class TeacherSerializer < PersonSerializer
  has_many :subjects
end