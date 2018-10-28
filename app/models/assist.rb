class Assist < ApplicationRecord
  PRESENT_CODES = [:full, :half].freeze

  validates :date, presence: true
  validate :correct_type?

  belongs_to :student
  belongs_to :course

  before_validation :set_default_type

  private

  def set_default_type
    self.present_code ||= PRESENT_CODES.first
  end

  def correct_type?
    errors.add(:assist, "Invalid #{present_code}, code must be #{PRESENT_CODES}") unless PRESENT_CODES.include?(present_code.to_sym)
  end
end
