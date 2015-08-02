class AddDefaultRatings < ActiveRecord::Migration
  def change
    change_column_default :story_games, :note_cards, 1
    change_column_default :video_games, :stars, 1
    change_column_default :board_games, :meeples, 1
  end
end
