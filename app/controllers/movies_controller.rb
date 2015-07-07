class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @new = Movie.new
  end

  def create
    @movies = Movie.all
    @new = Movie.new(create_params[:movie])
    @new.save

    render :index
  end

private
  def create_params
    params.permit(movie: [:title, :description, :director, :vote])
  end

end
