class Course < ApplicationRecord
  SHIFTS = %w[morning evening night].freeze

  validates :name, :max_students, presence: true
  validate :valid_shift

  belongs_to :academic_calendar
  belongs_to :manager, optional: true
  has_many :subjects, dependent: :destroy
  has_many :students
  has_many :attendances, dependent: :destroy

  before_validation :set_defaults

  delegate :count, to: :subjects, prefix: true
  delegate :count, to: :students, prefix: true

  private

  def set_defaults
    self.max_students ||= 100
    self.shift ||= 'morning'
  end

  def valid_shift
    errors.add(:course, 'Invalid shift. shift should be (morning, evening or night)') unless SHIFTS.include?(shift)
  end
end
