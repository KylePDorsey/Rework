get '/auctions' do
	@auctions = Auction.all
	erb :'/auctions/index'
end

get '/auctions/new' do
	if logged_in?
		erb :'/auctions/new'
	else
		@errors = ["You must login to create an auction"]
		@auctions = Auction.all
		erb :'/auctions/index'
	end
end

get '/auctions/:id' do
	@auction = Auction.find_by(id: params[:id])
	if @auction
		if logged_in?
			@bid = Bid.find_by(user_id: current_user.id, auction_id: @auction.id)
		end
		erb :'/auctions/show'
	else
		#auction not found
		redirect '/'
	end
end



get '/auctions/:id/edit' do
	@auction = Auction.find_by(id: params[:id])
	if @auction
		if @auction.user_id == current_user.id
			erb :'/auctions/edit'
		else
			@errors = ["You must be the seller to edit the auction"]
			@auctions = current_user.auctions
			@bids = current_user.bids
			erb :'/users/show'
		end
	else
		redirect '/'
	end
end

put '/auctions/:id' do
	@auction = Auction.find_by(id: params[:id])
	if @auction.user_id == current_user.id
		@auction.update(params[:auction])
		if @auction.save
			redirect "/users/#{current_user.id}"
		else
			@errors = ["Something went wrong"]
			erb :'/auctions/edit'
		end
	else
		redirect "/users/#{current_user.id}"
	end
end

delete '/auctions/:id' do
	auction = Auction.find_by(id: params[:id])
	if auction.user_id == current_user.id
		auction.destroy
	else
		#you must be the author of this post to delete it
	end
	redirect "/users/#{current_user.id}"
end


post '/auctions' do
	if logged_in?
	params[:auction][:user_id] = current_user.id
	auction = Auction.new(params[:auction])
		if auction.save
			redirect "/users/#{current_user.id}"
		else
			@errors = ["Please enter all fields"]
			erb :'/auctions/new'
		end
	else
		@errors = ["You must login to create an auction"]
		@auctions = Auction.all
		erb :'/auctions/index'
	end
end











