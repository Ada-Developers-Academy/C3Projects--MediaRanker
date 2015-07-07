class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    movie = Movie.create(movie_params)

    redirect_to movie
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :description, :rank)
  end
end
