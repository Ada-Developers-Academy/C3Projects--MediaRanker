class WelcomeController < ApplicationController
  def index
    @top_movies = Movies.all
  end
end
