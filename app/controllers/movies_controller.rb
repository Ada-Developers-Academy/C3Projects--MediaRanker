class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  
  end

  def new
    @movie = Movie.new
    @method = :post
    
  end

  def create
    @movie = Movie.create(movie_params)
  end


  def show
    @movie = Movie.find(params[:id])
    @edit_path = edit_movie_path(@movie.id)
    @index_path = movies_path
  end

  def upvote
    @movie = Movie.find(params[:id])
    @method = :patch
    @movie.votes += 1
    render :show
  end

  def movie_params
    params.require(:movie).permit(:name, :description, :director, :votes)
  end
end
