get '/decks' do
  @decks = Deck.all  
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  erb :
end