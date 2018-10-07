class Subject < ApplicationRecord
  DAYS = %w[monday tuesday wednesday thursday friday saturday].freeze

  validates :name, :course, presence: true
  validate :valid_day

  before_validation :set_defaults

  belongs_to :teacher, optional: true
  belongs_to :course
  has_many :programs, dependent: :destroy
  has_many :qualification_report_subjects, dependent: :destroy

  private

  def set_defaults
    self.day ||= 'monday'
  end

  def valid_day
    errors.add(:subject, 'Invalid day. days should be (monday, tuesday, wednesday, thursday, friday or saturday)') unless DAYS.include?(day)
  end
end
