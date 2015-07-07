class MoviesController < ApplicationController

  def index
    @all = Movie.all
    @controller = "movies"
  end

  def show
    @single = find_movie
    @controller = "movies"
    @creator = "Directed by"
  end

  # PRIVATE METHODS ----------------------------------------------------------

  private

  def find_movie
    @movie = Movie.find(create_params[:id])
  end

  def create_params
    params.permit(:id, movie: [:id, :name, :creator, :description, :rank])
  end

end
