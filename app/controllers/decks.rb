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
      # create guess correct true
      p Round.find(@round.id).guesses.build(correct: true, card_id: @current_card.id, round_id: @round.id).save
    else
      # create guess correct false
    end
    # increment card
  end
  erb :'/decks/show'
end