class WelcomeController < ApplicationController

  def index
    @movies = Movie.top
  end

end
