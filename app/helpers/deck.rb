def correct_guess
  @round.guesses.build(correct: true, card_id: @current_card.id, round_id: @round.id).save
end

def false_guess
  @round.guesses.build(correct: false, card_id: @current_card.id, round_id: @round.id).save
end