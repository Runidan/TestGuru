class CreateBangesUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :badges, :users do |t|
      t.index [:badge_id, :user_id]
    end
  end
end
