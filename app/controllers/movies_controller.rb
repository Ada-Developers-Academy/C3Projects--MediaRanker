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
    @movie = Movie.new
  end

  def create
    Movie.create(movie_params)
    redirect_to movies_path
  end

  def edit

  end

  def update

  end

  def destroy

  end



  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description)
  end

end
