class Feedback < ApplicationRecord
  validates :to, :student, :value, presence: true
  validate :range

  belongs_to :student
  belongs_to :to, polymorphic: true

  private

  def range
    errors.add(:base, 'Value should be a value from 1 to 5') unless value >= 1 && value <= 5
  end
end
