class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :upvote, :destroy]

  def index
    @media = Movie.ranked
    render 'shared/index'
  end

  def new
    @medium = Movie.new
    render 'shared/form'
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  def edit
    @medium = @movie
    render 'shared/form'
  end

  def update
    @movie.update(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :edit
    end
  end

  def upvote
    @movie.add_vote
    
    redirect_to @movie
  end

  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :creator, :description, :rank)
  end

  def self.model
    Movie
  end
end
