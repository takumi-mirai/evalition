class Topic < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts, allow_destroy: true
end
