class MoviesController < ApplicationController
  before_action :set_movie, only: [:update, :show]

  def index
    @movies = Movie.all
  end

  def update
    puts params.inspect
    if params[:upvote] == true
      Movie.upvote(@movie)
      puts "updated"
      redirect_to movie_path(@movie)
    else
      render :index
    end
  end

  def show
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end
end
