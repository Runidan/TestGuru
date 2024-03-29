# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :url, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
