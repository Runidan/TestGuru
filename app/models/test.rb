# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy

  def self.get_test_titles_of_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :asc)
      .pluck(:title)
  end
end
