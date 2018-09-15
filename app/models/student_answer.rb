class StudentAnswer < ApplicationRecord


  validates :name, presence: true, uniqueness: true
  with_options inverse_of: :xxx, dependent: :destroy do
    has_many :yyy
  end
  has_one :yyy
  belongs_to :yyy

end
