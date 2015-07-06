class CreateVideoGames < ActiveRecord::Migration
  def change
    create_table :video_games do |t|
      t.string :title
      t.string :studio
      t.text :description
      t.integer :stars

      t.timestamps null: false
    end
  end
end
