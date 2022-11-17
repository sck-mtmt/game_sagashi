class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      
      t.string :game_title
      t.string :game_description
      t.integer :price
      t.integer :game_model
      t.integer :capacity
      t.integer :review_count
      t.integer :amazon_url
      t.string :memo
      t.timestamps
    end
  end
end
