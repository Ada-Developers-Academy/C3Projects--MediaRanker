class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(create_params[:task])
    @movie.save
  end

  private

  def create_params
    params.permit(movie: [:name, :director, :description :ranking])
  end
end
