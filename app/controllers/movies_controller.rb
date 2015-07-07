class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    show
  end

  def update
    show
    @movie.update(create_params[:movie])

    redirect_to movie_path(@movie.id)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(create_params[:movie])
    @movie.rank = 0
    @movie.save
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def destroy
    show
    @movie.destroy

    redirect_to movies_path
  end

  def upvote
    show
    @movie.rank += 1
    @movie.save

    redirect_to movie_path(@movie.id)
  end

  private

  def create_params
    params.permit(movie: [:title, :director, :rank, :description])
  end
end
