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
  @round = Round.where(deck_id: params[:id], user_id: session[:user_id], complete: false).first_or_create
  @current_card = @deck.cards.first

  if params[:current_card]
    @current_card = find_card(params[:current_card])
    if @deck.compare_question_answer(params[:answer], @current_card.answer)
      @message = ["Correct!"]
      correct_guess
    else
      @message = ["Sorry, the answer was #{@current_card.answer}"]
      false_guess
    end
    if @deck.cards.count > @current_card.id
      @current_card = find_card(@current_card.id += 1)
    else
      @message = ["You've completed the deck! Click button below to exit."]
      @current_card
    end
  end
  @correct_guesses = total_correct
  @false_guesses = total_false
  erb :'/decks/show'
end

delete '/decks/:id' do
  round = Round.where(user_id: session[:user_id], deck_id: params[:id], complete: false)
  round.first.update_attributes(complete: true)
  # round.destroy
  redirect '/decks'
end