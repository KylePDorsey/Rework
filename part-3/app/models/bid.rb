class Bid < ActiveRecord::Base
	belongs_to :user
	belongs_to :auction

  validates :user, :auction, presence: true
  validates :user_id, :auction_id, :ammount, presence: true	

  # add bid methods to make sure bid is not 0
  # => bid is higer than previous
  # => prevent bidding on own items
  # => prevent bidding unless auction is live

  validate :cannot_bid_on_own_items
  validate :cannot_bid_on_ended_auction
  validate :cannot_bid_on_auction_not_begun

  def cannot_bid_on_own_items
    if user_id == auction.user_id
      errors.add(:user_id, 'cannot be the same as the auction creator.')
    end
  end

  def cannot_bid_on_ended_auction
    if auction.end_time < Time.now
      errors.add(:auction, 'has already ended.')
    end
  end

  def cannot_bid_on_auction_not_begun
    if auction.start_time > Time.now
      errors.add(:auction, 'has not started')
    end
  end

  def winner?
    return true if self.auction.end_time < Time.now && self == self.auction.top_bid
  end
end
