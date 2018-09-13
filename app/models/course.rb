class Course < ApplicationRecord
  validates :name, :max_students, presence: true

  belongs_to :academic_calendar

  before_validation :set_defaults

  private

  def set_defaults
    self.max_students ||= 100
  end
end
