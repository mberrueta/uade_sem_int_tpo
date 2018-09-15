class AcademicCalendar < ApplicationRecord
  TYPES = [:morning, :afternoon, :night].freeze

  validates :year, :calendar_type, presence: true

  belongs_to :organization
  has_many :courses, dependent: :destroy

  before_validation :set_defaults

  private

  def set_defaults
    self.calendar_type ||= TYPES.first
    self.year ||= Date.current.year
  end
end
