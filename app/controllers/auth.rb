require 'pry'
get '/login' do
  erb :'/auth/login'
end

get '/signup' do
  erb :'/auth/signup'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user == nil
    @error_message = true
    erb :'/auth/login'
  elsif @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/decks'
  end
end

post '/signup' do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/decks'
  else
    @username_taken = true
    erb :'/auth/signup'
  end
end

delete '/logout' do
  session.clear
  redirect '/'
end

