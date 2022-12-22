class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|

      t.string :game_title
      t.string :game_description
      t.integer :price
      t.integer :game_model,null:false
      t.integer :capacity
      t.boolean :is_active, default: false,null:false
      t.timestamps
    end
  end
end
