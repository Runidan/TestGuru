# frozen_string_literal: true

class DropTableRecords < ActiveRecord::Migration[6.1]
  def change
    drop_table :records, force: :cascade, if_exists: true
  end
end
