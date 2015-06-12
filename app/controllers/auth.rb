get '/login' do
  erb :'/auth/login'
end

get '/signup' do
  erb :'/auth/signup'
end

post '/login' do
  p params
  @user = User.find_by(username: params[:username])
  if @user.password == params[:password]
    "Howdy!!"
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

