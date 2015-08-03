class MoviesController < ApplicationController
  before_action :find_movie, only: [ :show, :edit, :update, :destroy, :upvote ]

  def self.model
    Movie
  end

  def index
    @movies = Movie.all.rank_order
  end

  def show; end

  def edit; end

  def update
    @movie.update(create_params[:movie])

    redirect_to movie_path(@movie.id)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(create_params[:movie])

    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  def upvote
    @movie = Movie.upvote_medium(@movie)


    redirect_to movie_path(@movie.id)
  end

  private

  def create_params
    params.permit(movie: [:title, :director, :rank, :description])
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
