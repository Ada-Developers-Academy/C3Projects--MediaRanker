class MoviesController < ApplicationController
  before_action :find_movie, except: [:index, :new, :create]

  def index
   @movies = Movie.ordered
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params[:movie])

    if @movie.save
      render :show
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    @movie.update(movie_params[:movie])
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :edit # if the edit doesn't save due to a missing required field from the user, then it will render the edit page with the params
    end
  end

  def upvote
    Movie.upvote(@movie)
    redirect_to movie_path(@movie.id)
  end

  def destroy
    @move.destroy
    redirect_to movies_path
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.permit(movie: [:name, :director, :description])
  end



end
