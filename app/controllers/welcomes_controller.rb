class WelcomesController < ApplicationController

  def index
    @video_games = VideoGame.all.order('stars DESC')
    @story_games = StoryGame.all.order('index_cards DESC')
    @board_games = BoardGame.all.order('meeples DESC')
  end

end
