class Lesson < ApplicationRecord
  validates :subject, :date, :class_number, presence: true

  before_validation :assign_class_number, unless: :class_number

  has_many :topics, dependent: :destroy
  belongs_to :subject
  has_one :exam

  delegate :count, to: :topics, prefix: true
  delegate :teacher, to: :subject

  after_create :create_exam

  private

  def assign_class_number
    self.class_number ||= max_class + 1
  end

  def max_class
    Lesson.where(subject: subject).maximum(:class_number) || 0
  end

  def create_exam
    Exam.new(
      lesson: self,
      title: "#{title} exam"
    ).save!
  end
end
