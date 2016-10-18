class Auction < ActiveRecord::Base
	belongs_to :user
	has_many :bids
	has_many :bidders, through: :bids, source: :user

	validate :end_time_after_start_time

  def end_time_after_start_time
    unless end_time > start_time
      errors.add(:end_time, "must be after start time")
    end
  end


  def top_bid
    bids_array = bids.sort{|a, b| b.ammount <=> a.ammount}
    p bids_array
    top_bid = bids_array.shift
  end
end
