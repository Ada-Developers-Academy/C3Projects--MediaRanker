class MoviesController < ApplicationController
  before_action :set_movie, only: [:update]

  def index
    @movies = Movie.all
  end

  def update
    if params[:upvote] == "true"
      Movie.upvote(@movie)
      redirect_to movie_path(@movie)
    end
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end
end
