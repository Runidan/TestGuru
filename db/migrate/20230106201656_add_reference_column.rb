class AddReferenceColumn < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :badge
    add_reference :tests, :badge
  end
end
