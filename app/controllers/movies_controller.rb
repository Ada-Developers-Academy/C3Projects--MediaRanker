class MoviesController < ApplicationController

  def index
    @movies = Movie.ranking
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.rank += 1
    movie.save

    redirect_to movie_path
  end

  private

  def create_params
    params.require(:movie).permit(:name, :director, :description, :rank)
  end

end
