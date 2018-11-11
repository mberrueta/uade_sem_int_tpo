class Topic < ApplicationRecord
  validates :title, :lesson, presence: true

  belongs_to :lesson
end
