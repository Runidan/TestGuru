# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions
  

  def self.get_test_titles_of_category(category)
    joins('INNER JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: category })
      .order(title: :asc)
      .pluck(:title)
  end
end
