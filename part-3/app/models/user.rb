class User < ActiveRecord::Base
	has_many :bids
	has_many :auctions
	has_many :bidded_auctions, through: :bids, source: :auction

	validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validate :validate_password



  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user_to_authenticate = User.find_by(email: email)
    if user_to_authenticate
      return user_to_authenticate if user_to_authenticate.password == password
    end
    nil
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 5
      errors.add(:password, "must be greater than 5 characters")
    end
  end

  def winnings
    bids_to_map = self.bids.to_a
    wins = bids_to_map.map {|bid| bid if bid.winner? }
    wins.compact
  end
end
