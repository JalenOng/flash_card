class CreateRounds < ActiveRecord::Migration
  def change
     create_table :rounds do |p|
      p.integer :deck_id
      p.integer :user_id
      p.timestamps
    end
  end
end
