class Badge < ApplicationRecord
  has_and_belongs_to_many :user

  validates :badge_type, :image, :value, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :discription, length: { maximum: 240 }
end
