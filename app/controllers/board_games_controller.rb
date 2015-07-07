class BoardGamesController < ApplicationController
  def index
    @board_games = BoardGame.all.order('meeples DESC')
    render :index
  end

  def show
    @board_game_id = params[:id]
    @board_game = BoardGame.find(@board_game_id)

    render :show
  end

  # Add a new Board Game
  def new
    @board_game = BoardGame.new(board_game_params[:board_game])
  end

  def create
    @board_game = BoardGame.create(board_game_params[:board_game])

    redirect_to board_game_path(@board_game.id)
  end

  # Update an existing Board Game
  def edit
    @board_game_id = params[:id]
    @board_game = BoardGame.find(@board_game_id)

    render :edit
  end

  def update
    @board_game_id = params[:id]
    @board_game = BoardGame.find(@board_game_id)
    @board_game.update(board_game_params[:board_game])

    redirect_to board_game_path
  end

  def destroy
    @board_game_id = params[:id]
    @board_game = BoardGame.find(@board_game_id)
    @board_game.destroy

    redirect_to board_games_path
  end

  private

  def board_game_params
    params.permit(board_game: [:title, :description, :author, :stars])
  end

end
