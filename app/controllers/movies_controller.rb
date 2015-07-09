class MoviesController < ApplicationController
  before_action :set_movie, only: [:update, :show]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(create_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def update
    if params[:upvote] == "true"
      Movie.upvote(@movie)
      redirect_to movie_path(@movie)
    else
      render :index
    end
  end

  def show
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def create_params
    params.require(:movie).permit(:title, :directed_by, :description)
  end
end
