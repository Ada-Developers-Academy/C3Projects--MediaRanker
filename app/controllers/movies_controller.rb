class MoviesController < ApplicationController

  def index
    @controller = "movies"
    @model = Movie
  end

  def show
    @single = find_movie
    @controller = "movies"
    @creator = "Directed by"
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to "/movies/#{@movie.id}"
  end

  def edit
    @single = find_movie
  end

  def update
    @single = find_movie
    @single.update(movie_params)
    @single.save

    redirect_to "/movies/#{@movie.id}"
  end

  def upvote
    @single = find_movie
    @single.rank += 1
    @single.save

    redirect_to :movie
  end

  def destroy
    @single = find_movie
    @single.destroy

    redirect_to :movies
  end

  # PRIVATE METHODS ----------------------------------------------------------
private
  def self.model
    Movie
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:id, :name, :creator, :description, :rank)
  end

end
