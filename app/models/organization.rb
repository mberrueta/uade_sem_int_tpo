class Organization < ApplicationRecord
  ORGANIZATION_TYPES = [:school, :university].freeze

  validates :name, :phone, :address, presence: true
  validate :correct_type?

  has_many :academic_calendars, inverse_of: :organization, dependent: :destroy
  has_many :news
  has_many :people

  before_validation :set_default_type

  private

  def set_default_type
    self.organization_type ||= ORGANIZATION_TYPES.first
  end

  def correct_type?
    errors.add(:organization, "Invalid #{organization_type }, organization type must be #{ORGANIZATION_TYPES}") unless ORGANIZATION_TYPES.include?(organization_type .to_sym)
  end
end
