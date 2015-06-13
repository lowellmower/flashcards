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

  if params[:current_card]
    @current_card = @deck.cards.find(params[:current_card])
    if Deck.compare_question_answer(params[:answer], @current_card.answer)
      redirect '/'
    end
  end
  # if compare_question_answer(params[:answer],
  erb :'/decks/show'
end