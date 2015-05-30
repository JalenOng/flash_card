class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |p|
      p.integer :card_id
      p.integer :round_id
      p.string :status
      p.timestamps
    end
  end
end
