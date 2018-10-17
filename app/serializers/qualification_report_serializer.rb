class QualificationReportSerializer < AbstractSerializer
  attributes :notes

  has_many :qualification_report_subjects, serializer: QualificationReportSubjectSerializer
end