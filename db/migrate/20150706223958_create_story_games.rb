class CreateStoryGames < ActiveRecord::Migration
  def change
    create_table :story_games do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :note_card

      t.timestamps null: false
    end
  end
end
