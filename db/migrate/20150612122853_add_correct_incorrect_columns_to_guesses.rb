class AddCorrectIncorrectColumnsToGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :correct_guess, :integer
    add_column :guesses, :incorrect_guess, :integer
  end
end
