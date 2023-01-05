class AddUniqueConstraintsToBadges < ActiveRecord::Migration[6.1]
  def change
    add_index :badges, [:type, :option], unique: true
  end
end
