class Topic < ApplicationRecord
  validates :title, :program, presence: true

  belongs_to :program
end
