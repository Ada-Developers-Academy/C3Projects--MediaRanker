class MoviesController < ApplicationController

  before_action :find_movie, except: [:index, :new, :create]

  def index
    @movies = Movie.all
  end

  def show
  end

  def edit
  end

  def new
    @movie = Movie.new
  end

  def create
    params = movie_params[:movie]
    @movie = Movie.new(params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end

  end

  def update
    @movie.update(movie_params[:movie])

    redirect_to movie_path(params[:id])
  end

  def destroy
    @movie.destroy

    redirect_to movies_path    
  end

  def upvote
    @movie.rank += 1
    @movie.save

    redirect_to movie_path(params[:id])
  end

##################### PRIVATE METHODS #####################
  private

  def movie_params
    params.permit(movie: [:id, :name, :director, :description, :rank])
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
