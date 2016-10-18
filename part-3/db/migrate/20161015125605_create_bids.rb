class CreateBids < ActiveRecord::Migration
  def change
  	create_table :bids do |t|
  		t.integer :user_id, :auction_id, null: false
  		t.float :ammount, null: false

  		t.timestamps(null: false)
  	end
  end
end
