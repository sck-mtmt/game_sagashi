class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :user_id
      t.integer :game_id
      t.float :star
      t.string :review_title
      t.string :review_body
    end
  end

  # def change
  #   create_table :games, id: false do |t|
  #     t.references :game, null: false
  #     t.references :user, null: false, foreign_key: true

  #     t.timestamps
  #   end
  #   add_foreign_key :bookcases, :games, column: :game_id , primary_key: :isbn

  #     t.timestamps
  # end
end
