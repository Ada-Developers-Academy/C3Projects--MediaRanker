class MoviesController < ApplicationController

  before_action :get_movie, only: [:show, :edit, :update, :destroy]

  def get_movie
    @movie = Movie.find(params[:id])
  end

  def show
  end

  def update
    @movie.update(movie_params)
    @movie.vote += 1
    @movie.save

    redirect_to movie_path
  end

  def edit
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :director, :desc)
  end

end
