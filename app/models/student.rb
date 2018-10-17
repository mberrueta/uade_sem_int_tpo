class Student < Person
  has_many :assists
  has_one :qualification_report
  belongs_to :course
end