class Student < Person
  has_many :attendances
  has_one :qualification_report
  belongs_to :course
end