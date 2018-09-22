class Course < ApplicationRecord
  validates :name, :max_students, presence: true

  belongs_to :academic_calendar
  has_many :subjects, dependent: :destroy
  has_many :assists, dependent: :destroy

  before_validation :set_defaults

  private

  def set_defaults
    self.max_students ||= 100
  end
end
