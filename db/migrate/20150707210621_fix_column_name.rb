class FixColumnName < ActiveRecord::Migration
  def change
  rename_column :story_games, :note_card, :note_cards
  end
end
