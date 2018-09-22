class Program < ApplicationRecord
  validates :subject, :day, :class_number, presence: true

  before_validation :assign_class_number, unless: :class_number

  has_many :topics, dependent: :destroy
  belongs_to :subject

  private

  def assign_class_number
    self.class_number ||= max_class + 1
  end

  def max_class
    Program.where(subject: subject).maximum(:class_number) || 0
  end
end
