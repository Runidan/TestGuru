class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, limit: 30, null: false
      t.string :discription, limit: 240
      t.string :badge_type, null: false
      t.string :image, null: false
      t.integer :level


      t.timestamps
    end
  end
end
