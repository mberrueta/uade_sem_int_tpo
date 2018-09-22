class Person < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone, :address, :gender, presence: true

  belongs_to :organization

  before_save :set_type

  private

  def set_type
    self.type = self.class.name
  end
end
