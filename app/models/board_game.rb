class BoardGame < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :ordered_by_meeples, -> { order('board_games.meeples DESC') }
end
