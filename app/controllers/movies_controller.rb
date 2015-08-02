class MoviesController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :upvote, :destroy]

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
    render 'shared/form'
  end

  def update
    @medium.update(movie_params)
    if @medium.save
      redirect_to @medium
    else
      render :edit
    end
  end

  def upvote
    @medium.add_vote
    
    redirect_to @medium
  end

  def destroy
    @medium.destroy

    redirect_to movies_path
  end

  private

  def set_medium
    @medium = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :creator, :description, :rank)
  end

  def self.model
    Movie
  end
end
