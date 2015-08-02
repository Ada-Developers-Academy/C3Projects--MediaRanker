class StoryGamesController < ApplicationController
  def index
    @story_games = StoryGame.all
    render :index
  end

  def show
    locate_story_game

    render :show
  end

  # Add a new Story Game
  def new
    @story_game = StoryGame.new(story_game_params[:story_game])
  end

  def create
    @story_game = StoryGame.create(story_game_params[:story_game])
    if @story_game.save
      redirect_to story_game_path(@story_game.id)
    else
      flash[:error] = "You must include a title."
      redirect_to new_story_game_path
    end
  end

  # Upvote an existing Video Game
  def upvote
    locate_story_game
    @story_game.rating += 1
    @story_game.save

    redirect_to story_game_path(@story_game.id)
  end

  # Update an existing Story Game
  def edit
    locate_story_game

    render :edit
  end

  def update
    locate_story_game
    @story_game.update(story_game_params[:story_game])

    redirect_to story_game_path
  end

  def destroy
    locate_story_game
    @story_game.destroy

    redirect_to story_games_path
  end

  def locate_story_game
    story_game_id = params[:id]
    @story_game = StoryGame.find(story_game_id)
  end

  private

  def story_game_params
    params.permit(story_game: [:title, :description, :author, :note_cards])
  end

end
