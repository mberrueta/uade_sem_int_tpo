class Student < Person
  has_many :attendances
  has_one :qualification_report
  belongs_to :course

  delegate :qualification_report_subjects, to: :qualification_report, allow_nil: true

  before_save :create_qualification_report, if: :course

  def average_qualification
    return nil unless course && qualification_report_subjects&.any?

    sum = qualification_report_subjects.map(&:final).inject do |sum, el|
      sum + el
    end.to_f
    sum / qualification_report_subjects.size
  end

  private

  def create_qualification_report
    QualificationReport.find_or_create_by(student_id: id)

    course.subjects.each do |subject|
      QualificationReportSubject.find_or_create_by(
        student_id: id,
        subject_id: subject.id
      )
    end
  end
end