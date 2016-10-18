post '/auctions/:auction_id/bid' do
  bid = Bid.new(user_id: current_user.id, auction_id: params[:auction_id], ammount: params[:ammount])
  @auction = Auction.find(params[:auction_id])

  if bid.save
    redirect "/auctions/#{params[:auction_id]}"
  else
    @errors = bid.errors.full_messages
    erb :'/auctions/show'
  end
end