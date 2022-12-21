class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games, id: false do |t|

      t.string :game_title
      t.string :game_description
      t.integer :price
      t.string :game_model
      t.integer :capacity
      t.bigint :isbn, null: false, primary_key: true
      t.string :rakuten_url
      t.string :large_image_url
      t.string :small_image_url
      t.boolean :is_active, default: false,null:false
      t.timestamps
    end
  end
end
