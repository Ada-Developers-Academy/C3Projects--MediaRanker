class StoryGame < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :ordered_by_rating, -> { order('story_games.rating DESC') }
end
