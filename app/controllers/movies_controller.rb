class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def create
    @new_movie = Movie.create(create_params[:movie])
    @new_movie.save

    redirect_to movie_path(@new_movie.id)
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update

  end

  private

  def create_params
    params.permit(movie: [:name, :director, :description, :ranking])
  end
end
