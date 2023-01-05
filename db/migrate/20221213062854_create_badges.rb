class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, limit: 25, null: false
      t.string :image, null: false
      t.string :type, null: false
      t.string :option, null: false

      t.timestamps
    end
  end
end
