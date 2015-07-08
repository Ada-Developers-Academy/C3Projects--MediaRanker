class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @medium = Movie.new
  end

  def create
    movie = Movie.create(movie_params)

    redirect_to movie
  end

  def edit
    @medium = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)

    redirect_to movie
  end

  def upvote
    movie = Movie.find(params[:id])
    movie.add_vote
    
    redirect_to movie
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :description, :rank)
  end
end
