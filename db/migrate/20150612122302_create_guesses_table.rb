class CreateGuessesTable < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :round
      t.references :card
      t.boolean :correct
      t.string :answer

      t.timestamps null: false
    end
  end
end
