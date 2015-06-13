class Card < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck

  def get_next_card

  end
end
