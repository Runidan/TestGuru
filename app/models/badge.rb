class Badge < ApplicationRecord
  has_and_belongs_to_many :user

  validates :image, :value, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :discription, length: { maximum: 240 }
  validates :badge_type, presence: true, inclusion: { in: BadgeService::TYPES_AND_METHODS.keys }
end
