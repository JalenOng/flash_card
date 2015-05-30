class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |p|
      p.integer :deck_id
      p.string :question
      p.string :answer
      p.timestamps
     end
  end
end
