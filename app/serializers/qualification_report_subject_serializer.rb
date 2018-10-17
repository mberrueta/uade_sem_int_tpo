class QualificationReportSubjectSerializer < AbstractSerializer
  attributes :notes, :results, :final

  belongs_to :subject
end