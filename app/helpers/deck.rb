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