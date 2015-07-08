class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(rank: :desc)
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.increment!(:rank)
    redirect_to movie_path(@movie)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @media = Movie.new
    @creator = :director
  end

  def create
    movie = Movie.create(movie_params)
    if movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @media = Movie.find(params[:id])
    @creator = :director
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update(movie_params)
      redirect_to movie_path(movie)
    else
      render :edit
    end
  end

  def destroy

  end



  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description)
  end

end
