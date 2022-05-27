# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :simple_lvl, -> { where(level: 0..1) }
  scope :middle_lvl, -> { where(level: 2..4) }
  scope :hard_lvl, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level:) }
  scope :by_category, ->(category) { joins(:category).where(category: { title: category }).order(title: :asc) }

  def self.get_test_titles_of_category(category)
    by_category(category).pluck(:title)
  end
end
