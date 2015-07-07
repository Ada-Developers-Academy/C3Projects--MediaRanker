class BoardGamesController < ApplicationController
  def index
    @board_games = BoardGame.all.order('stars DESC')
    render :board_games
  end

  def show
    @board_game_id = params[:id]
    @board_game = Market.find(@board_game_id)

    render :board_game_show
  end

  # Add a new Board Game
  def new
    @board_game = BoardGame.new(board_game_params[:board_game])
  end

  def create
    @board_game = BoardGame.create(board_game_params[:board_game])

    redirect_to :board_games
  end

  # Update an existing Board Game
  def edit
    render :edit
  end

  def update
    @board_game.update(board_game_params[:board_game])

    redirect_to :board_games
  end

  private

  def board_game_params
    params.permit(board_game: [:title, :description, :author, :stars])
  end

end
