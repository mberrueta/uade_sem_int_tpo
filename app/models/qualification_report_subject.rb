class QualificationReportSubject < ApplicationRecord
  belongs_to :qualification_report
  belongs_to :subject

  before_validation :set_default_type

  def final
    return 0 unless results.any?

    results.inject { |sum, el| sum + el }.to_f / results.size
  end

  private

  def set_default_type
    self.results ||= [0, 0, 0]
  end
end
