class RemoveAnswerFromGuesses < ActiveRecord::Migration
  def change
    remove_column :guesses, :answer
  end
end
