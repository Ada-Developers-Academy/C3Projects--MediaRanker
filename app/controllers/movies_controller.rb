class MoviesController < ApplicationController

  before_action :find_movie, except: [:index, :new, :create, :destroy]

  def index
    @movies = Movie.all

    @movies = @movies.order_desc
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params[:movie])

    redirect_to movies_path
  end

  def show

  end

  def edit

  end

  def update
    @movie.update(movie_params[:movie])

    redirect_to movie_path(@movie.id)
  end

  def upvote
    @movie.rank += 1

    @movie.save

    redirect_to(:back) rescue redirect_to movie_path
  end

  def destroy
    @movie = Movie.destroy(params[:id])

    redirect_to movies_path
  end

  private

  def movie_params
    params.permit(movie: [:name, :director, :description, :rank])
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end

