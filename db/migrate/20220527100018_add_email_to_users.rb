# frozen_string_literal: true

class AddEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string, null: false, unique: true
  end
end
