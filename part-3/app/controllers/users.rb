get '/users/new' do
  erb :'/users/new'
end


post '/users' do
  user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  if logged_in?
    @user = User.find_by(id: params[:id])
    if @user && current_user.id == @user.id
      @auctions = @user.auctions
      @bids = @user.bids
      erb :'/users/show'
    else
      redirect'/'
    end
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Username and/or Password are Incorrect!"]
    erb :'/users/login'
  end
end














