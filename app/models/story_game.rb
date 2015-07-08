class StoryGame < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :ordered_by_note_cards, -> { order('story_games.note_cards DESC') }
end
