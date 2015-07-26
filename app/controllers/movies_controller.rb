class MoviesController < ApplicationController
  before_action :find_movie, only: [:upvote, :show, :edit, :update, :destroy]

  def self.model
    Movie
  end

  def index
    @movies = Movie.descending_rank
    @movie = Movie.new # for link to :new
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
    @movie = Movie.new(permit_params[:movie])

    if @movie.save
      redirect_to movie_path(@movie)
    else
      @movie
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    updated_movie = permit_params[:movie]
    @movie.update(updated_movie)

    redirect_to movie_path
  end

  def destroy
    @movie.destroy
    redirect_to media_path
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def permit_params
    params.permit(movie: [:title, :director, :description])
  end
end
