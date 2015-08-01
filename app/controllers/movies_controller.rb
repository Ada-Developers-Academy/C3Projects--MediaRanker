class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @movies = Movie.desc_order
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params[:movie])
    @movie.ranking = 0

    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @movie.update(movie_params[:movie])

    if @movie.save
       redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  def upvote
    @movie.ranking += 1
    @movie.save

    redirect_to movie_path(@movie.id)
  end

# ______________________________________________________________________
  private

  def movie_params
    params.permit(movie: [:name, :director, :description, :ranking])
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
