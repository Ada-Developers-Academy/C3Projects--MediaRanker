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
    movie = Movie.create(permit_params)
    movie.rank = 0
    movie.save

    super
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    Movie.find(params[:id]).update(permit_params)

    super
  end

  def destroy
    Movie.find(params[:id]).destroy

    super
  end

  def upvote
    @movie = Movie.find(params[:id])
    votes = @movie.rank
    votes += 1
    @movie.update(rank: votes)

    super
  end

  private

  def permit_params
    params.require(:movie).permit(:name, :director, :description)
  end

end
