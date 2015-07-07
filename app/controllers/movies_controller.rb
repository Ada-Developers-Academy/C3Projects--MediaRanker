class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.increment!(:rank)
    redirect_to movie_path(@movie)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
