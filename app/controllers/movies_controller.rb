class MoviesController < ApplicationController

  def index
    @all = Movie.all
  end

end
