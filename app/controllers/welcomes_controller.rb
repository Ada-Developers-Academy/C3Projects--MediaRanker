class WelcomesController < ApplicationController

  def index
    @video_games = VideoGame.all.order('rating DESC')
    @story_games = StoryGame.all.order('rating DESC')
    @board_games = BoardGame.all.order('rating DESC')
  end

end
