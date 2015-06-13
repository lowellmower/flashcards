get '/login' do
  erb :'/auth/login'
end

get '/signup' do
  erb :'/auth/signup'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/decks'
  else
    "WTF ROSS!!!!!!!!!!"
  end
end

post '/signup' do
  user = User.create(params[:user])
  if user.save
    "YAY!"
    # redirect '/'
  else
    "bananananans"
  end
end

get '/logout' do
  session.clear
end

