class MoviesController < ApplicationController
  before_action :set_medium, except: [:index, :new, :create]

  def index
    @media = Movie.ranked
    render 'shared/index'
  end

  def new
    @medium = Movie.new
    render 'shared/form'
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render 'shared/form'
    end
  end

  private

  def set_medium
    @medium = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :creator, :description, :rank)
  end

  def self.model
    Movie
  end
end
