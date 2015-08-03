class MoviesController < ApplicationController

  before_action :find_and_set_media, only: [:upvote, :show, :edit, :update, :destroy]
  before_action :set_creator, only: [:show, :new, :create, :edit, :update]


  def index
    @media = Movie.ranked
    @new_media = Movie.new
    @add_media = "a Movie"
  end

  def upvote
    @media.increment!(:rank)
    redirect_to movie_path(@media)
  end

  def show
    @created = "Directed"
    @format = "Movies"
  end

  def new
    @media = Movie.new
  end

  def create
    @media = Movie.create(movie_params)
    if @media.save
      redirect_to movie_path(@media)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @media.update(movie_params)
      redirect_to movie_path(@media)
    else
      render :edit
    end
  end

  def destroy
    @media.destroy
    redirect_to movies_path
  end


  private

  def find_and_set_media
    @media = Movie.find(params[:id])
  end

  def set_creator
    @creator = :director
  end

  def movie_params
    params.require(:movie).permit(:name, :director, :description)
  end

end
