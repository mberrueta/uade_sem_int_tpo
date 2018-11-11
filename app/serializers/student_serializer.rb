class StudentSerializer < PersonSerializer
  attributes :average_qualification

  belongs_to :course
  has_one :qualification_report, serializer: QualificationReportSerializer
end