class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :upvote, :destroy]

  def index
    @controller = "movies"
    @model = Movie
  end

  def show
    @controller = "movies"
    @creator = "Directed by"
  end

  def new
    @single = Movie.new
  end

  def create
    @single = Movie.create(movie_params)

    if @single.save
      redirect_to movie_path(@single.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @single.update(movie_params)
    @single.save

    redirect_to movie_path(@single.id)
  end

  def upvote
    @single.increment!(:rank)
    @single.save
    redirect_to :movie
  end

  def destroy
    @single.destroy
    redirect_to :movies
  end

  # PRIVATE METHODS ----------------------------------------------------------
private
  def self.model # for rpsec controller testing
    Movie
  end

  def find_movie
    @single = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:id, :name, :creator, :description, :rank)
  end

end
