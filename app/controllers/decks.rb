get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  erb :'/decks/show'
end

post '/decks/:id' do
# yes, deck ID
  @deck = Deck.find(params[:id])
  @round = Round.where(deck_id: params[:id], user_id: session[:user_id]).first_or_create

  erb :'/decks/show'
end