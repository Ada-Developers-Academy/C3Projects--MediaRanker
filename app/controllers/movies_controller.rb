class MoviesController < ApplicationController

  def index
    @movies = Movie.best_first_all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(permit_params)
    @movie.rank = 0
    if @movie.save
      super
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(permit_params)
      super
    else
      render :edit
    end
  end

  def destroy
    Movie.find(params[:id]).destroy

    super
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.increment!(:rank)

    super
  end

  private

  def permit_params
    params.require(:movie).permit(:name, :director, :description)
  end

end
