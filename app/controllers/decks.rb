get '/decks' do
  current_user(session[:user_id])
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/:id' do
  current_user(session[:user_id])
  @deck = Deck.find_by(id: params[:id])
  erb :'/decks/show'
end

post '/decks/:id' do
  current_user(session[:user_id])
  @deck = Deck.find(params[:id])
  @deck_rounds = Round.where(deck_id: @deck.id, user_id: session[:user_id]).count
  @round = find_round.first_or_create
  @current_card = @deck.cards.first

  if params[:current_card]
    @current_card = find_card(params[:current_card])
    if @deck.compare(params[:answer], @current_card.answer)
      correct_guess
      @message = ["Correct!"]
    else
      false_guess
      @message = ["Sorry, the answer was #{@current_card.answer}"]
    end
    if @deck.cards.count > @current_card.id
      @current_card = find_card(@current_card.id += 1)
    else
      @current_card
      @message = ["You've completed the deck! Click button below to exit."]
    end
  end
  @correct_guesses = total_correct
  @false_guesses = total_false
  erb :'/decks/show'
end

delete '/decks/:id' do
  round = find_round
  round.first.update_attributes(complete: true)
  redirect '/decks'
end