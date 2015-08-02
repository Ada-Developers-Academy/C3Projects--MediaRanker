class BoardGame < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  scope :ordered_by_rating, -> { order('board_games.rating DESC') }

  def locate_board_game
    board_game_id = params[:id]
    @board_game = BoardGame.find(board_game_id)
  end
end
