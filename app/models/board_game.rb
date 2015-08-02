class BoardGame < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :ordered_by_rating, -> { order('board_games.rating DESC') }
end
