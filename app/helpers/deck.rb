def correct_guess
  @round.guesses.build(correct: true, card_id: @current_card.id, round_id: @round.id).save
end

def false_guess
  @round.guesses.build(correct: false, card_id: @current_card.id, round_id: @round.id).save
end

# should this go in deck model?
def find_card(card_info)
  @deck.cards.find(card_info)
end

def total_correct
  @round.guesses.where(correct: true).count
end

def total_false
  @round.guesses.where(correct: false).count
end

def current_user(session_id)
  @user = User.find(session_id)
  @user
end

def find_round
  Round.where(deck_id: params[:id], user_id: session[:user_id], complete: false)
end