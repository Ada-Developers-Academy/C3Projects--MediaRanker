class MoviesController < ApplicationController

  def index
   @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to '/movies'
  end
end
