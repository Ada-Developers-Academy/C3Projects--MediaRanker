class MoviesController < ApplicationController
  before_action :find_movie, only: [:upvote, :show, :edit, :update, :destroy]

  def self.model
    Movie
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def index
    @movies = Movie.all.order('ranking DESC')
  end

  def new
    @movie = Movie.new
  end

  def upvote
    @movie.ranking += 1
    @movie.save

    render :show, medium: @movie
  end

  def create
    movie = Movie.new(create_params[:movie])
    movie.save # opportunity for validity checks

    redirect_to movie_path(movie)
  end

  def show; end

  def edit; end

  def update
    updated_movie = create_params[:movie]
    # opportunity for .valid? and error handling
    @movie.update(updated_movie)

    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy
    redirect_to media_path
  end

  private

  def create_params
    params.permit(movie: [:title, :director, :description])
  end
end
