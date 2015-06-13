get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  erb :'/decks/show'
end

post '/decks/:id' do
  @deck = Deck.find(params[:id])
  @round = Round.where(deck_id: params[:id], user_id: session[:user_id]).first_or_create
  @current_card = @deck.cards.first

  if params[:current_card]
    @current_card = @deck.cards.find(params[:current_card])
    if Deck.compare_question_answer(params[:answer], @current_card.answer)
      # create guess correct true ***create helper methods****
      session[:message] = ["Correct!"]
      @round.guesses.build(correct: true, card_id: @current_card.id, round_id: @round.id).save
    else
      session[:message] = ["Sorry, the answer was #{@current_card.answer}"]
      # create guess correct false ***create helper methods****
      @round.guesses.build(correct: false, card_id: @current_card.id, round_id: @round.id).save
    end
    # increment card
    @current_card = @deck.cards.find(@current_card.id += 1)
  end
  @correct_guesses = @round.guesses.where(correct: true).count
  @false_guesses = @round.guesses.where(correct: false).count
  erb :'/decks/show'
end