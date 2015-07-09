class MoviesController < ApplicationController
  def index
    @movies = Movie.all.rank_order
    @media_type = "movie"
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if params[:movie].nil? == true
      @movie.rank += 1
      @movie.save
    else
      @movie.update(movie_params)
    end

    render :show
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy

    redirect_to root_path
  end

  def new
    @movie = Movie.new
  end

  def create
    movie = Movie.create(movie_params)

    redirect_to movie_path(id: movie.id)
  end

  private

  def movie_params
    params[:movie].permit(:title, :director, :description, :rank)
  end
end
