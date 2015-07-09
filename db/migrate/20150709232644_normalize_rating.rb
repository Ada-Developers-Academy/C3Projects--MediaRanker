class NormalizeRating < ActiveRecord::Migration
  def change
  rename_column :story_games, :ranking, :rating
  rename_column :board_games, :ranking, :rating
  rename_column :video_games, :ranking, :rating
  end
end
