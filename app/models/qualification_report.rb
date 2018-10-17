class QualificationReport < ApplicationRecord
  has_many :qualification_report_subjects, dependent: :destroy
  belongs_to :student
end
