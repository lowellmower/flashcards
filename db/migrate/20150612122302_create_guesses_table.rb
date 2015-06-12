class CreateGuessesTable < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :counter
      t.references :user

      t.timestamps null: false
    end
  end
end
