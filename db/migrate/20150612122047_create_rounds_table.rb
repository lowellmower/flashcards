class CreateRoundsTable < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user

      t.timestamps null: false
    end
  end
end
