class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :upvote, :destroy]
  before_action :set_medium, only: [:edit, :update]

  def index
    @movies = Movie.all_ranked
  end

  def new
    @medium = Movie.new
  end

  def create
    @medium = Movie.create(movie_params)
    if @medium.save
      redirect_to @medium
    else
      render :new
    end
  end

  def update
    @medium.update(movie_params)
    if @medium.save
      raise
      redirect_to @medium
    else
      render :edit
    end
  end

  def upvote
    @movie.add_vote
    
    redirect_to @movie
  end

  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_medium
    @medium = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :creator, :description, :rank)
  end
end
