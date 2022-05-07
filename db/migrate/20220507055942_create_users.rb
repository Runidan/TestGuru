class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :login, limit: 20
      t.string :password_digest

      t.timestamps
    end
  end
end
