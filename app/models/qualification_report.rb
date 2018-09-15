class QualificationReport < ApplicationRecord
  has_many :qualification_reports_subjects, dependent: :destroy
  belongs_to :student
end
