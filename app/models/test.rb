class Test < ApplicationRecord
  def self.titles(category)
    category_id = Category.select(:id).where("title = :title", title:category).first
    Test.where(category_id:category_id).order(title: :asc).select(:title)
  end
end
