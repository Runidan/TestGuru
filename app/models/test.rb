class Test < ApplicationRecord
  def self.get_test_titles_of_category(category)
    Test
      .joins("INNER JOIN categories ON categories.id = tests.category_id")
      .where(categories: {title: category})
      .order(title: :asc)
      .pluck(:title)
  end
end
