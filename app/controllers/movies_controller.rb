class MoviesController < ApplicationController

  def index
    @movies = Movie.all

    @movies = @movies.order('rank DESC')
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(create_params[:movie])

    redirect_to movies_path
  end

  def show
    @movie = Movie.find(params[:id])

  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.update(create_params[:movie])

    redirect_to movie_path(@movie.id)
  end

  def upvote
    @movie = Movie.find(params[:id])

    @movie.rank += 1

    @movie.save

    redirect_to(:back)
  end

  def destroy
    @movie = Movie.destroy(params[:id])

    redirect_to movies_path
  end

  private

  def create_params
    params.permit(movie: [:name, :director, :description, :rank])
  end

end

