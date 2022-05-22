# frozen_string_literal: true

class RemoveNameFromTests < ActiveRecord::Migration[6.1]
  def change
    remove_index :tests, :user_id
    remove_column :tests, :user_id, :string
    add_reference :tests, :author, references: :users, index: true
  end
end
