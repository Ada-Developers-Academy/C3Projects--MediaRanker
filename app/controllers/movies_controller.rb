class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def self.model
    Movie
  end

  def find_movie #Extracts out this search into one method
    @movie = Movie.find(params[:id])
  end

  def index
    movies = Movie.all
    count = movies.count
    @movies = Movie.ranking(count)
  end

  def show

  end

  def upvote
    movie = Movie.find(params[:id])
    movie.add_vote
    movie.save

    redirect_to movie_path
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(create_params[:movie])
    @movie.rank = 0

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @movie.update(create_params[:movie])

    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  private

  def create_params
    params.permit(movie: [:name, :creator, :description, :rank])
  end

end
