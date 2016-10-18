class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :username, :email, :password_hash, null: false

      t.timestamps(presence: true)
    end
  end
end
