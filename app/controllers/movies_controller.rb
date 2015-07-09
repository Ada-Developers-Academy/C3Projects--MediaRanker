class MoviesController < ApplicationController

  def index
    @movies = Movie.ranking(15)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def upvote
    movie = Movie.find(params[:id])
    movie.add_vote
    movie.save

    redirect_to movie_path
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(create_params[:movie])
    @movie.rank = 0
    @movie.save

    redirect_to movie_path(@movie)
  end

  def edit
    show
  end

  def update
    edit
    @movie.update(create_params[:movie])

    redirect_to movie_path(@movie)
  end

  def destroy
    edit
    @movie.destroy

    redirect_to movies_path
  end

  private

  def create_params
    params.permit(movie: [:name, :director, :description, :rank])
  end

end
