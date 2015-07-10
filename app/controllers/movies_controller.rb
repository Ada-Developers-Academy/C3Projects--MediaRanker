class MoviesController < ApplicationController
  before_action :set_movie, only: [:update, :show, :destroy, :edit]

  def self.model
    Movie
  end

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

  def edit
  end

  def update
    if params[:upvote] == "true"
      Movie.upvote(@movie)
      redirect_to movie_path(@movie)
    else
      if @movie.update(create_params)
        redirect_to movie_path(@movie)
      else
        render :edit
      end
    end
  end

  def show
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def create_params
    params.require(:movie).permit(:title, :directed_by, :votes, :description)
  end
end
