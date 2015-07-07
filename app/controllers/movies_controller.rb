class MoviesController < ApplicationController

  def index
    @movies = Movie.ranking
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
