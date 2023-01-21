class AddMinutesForPassToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :minutes_for_pass, :integer
  end
end
