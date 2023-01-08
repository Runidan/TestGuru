class AddColumnToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :pass, :boolean, default: false, null: false
  end
end
