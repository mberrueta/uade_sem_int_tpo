class StudentSerializer < PersonSerializer
  belongs_to :course
  has_one :qualification_report, serializer: QualificationReportSerializer
end