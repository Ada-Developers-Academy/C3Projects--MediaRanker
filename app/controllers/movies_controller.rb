class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.create(create_params[:task])
    @movie.save
  end

  def new
    @movie = Movie.new
  end

  def edit

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
