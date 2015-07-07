class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(create_params[:movie])

    redirect_to movie_path(params[:id])
  end


##################### PRIVATE METHODS #####################
  private

  def create_params
    params.permit(movie: [:id, :name, :director, :description, :rank])
  end

end
