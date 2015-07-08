class MoviesController < ApplicationController

  def index
    @all = Movie.all
    @controller = "movies"
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
    @movie = Movie.create(create_params[:movie])
    redirect_to "/movies/#{@movie.id}"
  end

  def edit
    @single = find_movie
  end

  def update
    @single = find_movie
    @single.update(create_params[:movie])
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

  def find_movie
    @movie = Movie.find(create_params[:id])
  end

  def create_params
    params.permit(:id, movie: [:id, :name, :creator, :description, :rank])
  end

end
