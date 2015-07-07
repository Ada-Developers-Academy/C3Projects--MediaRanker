class VideoGamesController < ApplicationController
  def index
    @video_games = VideoGame.all.order('stars DESC')

    render :video_games
  end

  def show
    @video_game_id = params[:id]
    @video_game = VideoGame.find(@video_game_id)

    render :video_game_show
  end

  # Add a new Video Game
  def new
    @video_game = VideoGame.new(video_game_params[:video_game])
  end

  def create
    @video_game= VideoGame.create(video_game_params[:vieo_game])

    redirect_to :video_games
  end

  # Update an existing Video Game
  def edit
    render :edit
  end

  def update
    @video_game.update(video_game_params[:video_game])

    redirect_to :video_games
  end

  private

  def video_game_params
    params.permit(video_game: [:title, :description, :studio, :stars])
  end

end
