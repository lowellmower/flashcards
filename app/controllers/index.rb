get '/' do
  if session[:user_id]
    current_user(session[:user_id])
    redirect '/decks'
  else
    erb :'index'
  end
end