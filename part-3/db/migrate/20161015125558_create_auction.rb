class CreateAuction < ActiveRecord::Migration
  def change
  	create_table :auctions do |t|
  		t.string :name, :condition, :description, null: false
  		t.integer :user_id, null: false
  		t.datetime :start_time, :end_time

  		t.timestamps(null: false)
  	end
  end
end
