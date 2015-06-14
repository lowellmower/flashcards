class Deck < ActiveRecord::Base
  has_many :cards
  belongs_to :round

  def sanatize_answer(user_input)
    user_input.downcase
  end

  def compare_question_answer(user_input, card_answer)
    return true if sanatize_answer(user_input) == card_answer.downcase
    false
  end
end
