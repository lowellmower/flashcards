get '/login' do
  erb :'/auth/login'
end

post '/login' do
  if User.authenticate(params[:username],params[password])
    redirect :'/decks'
  else
   redirect :'/login'
 end
end