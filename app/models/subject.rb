class Subject < ApplicationRecord
  validates :name, :course, presence: true

  belongs_to :course
  has_many :programs, dependent: :destroy
  has_many :qualification_report_subjects, dependent: :destroy
end
