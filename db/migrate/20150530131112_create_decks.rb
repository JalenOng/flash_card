class CreateDecks < ActiveRecord::Migration
  def change
     create_table :decks do |p|
      p.string :name
      p.timestamps
     end
  end
end
