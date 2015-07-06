class CreateBoardGames < ActiveRecord::Migration
  def change
    create_table :board_games do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :meeples

      t.timestamps null: false
    end
  end
end
