class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    find_movie
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    render :new
  end

  def create
    @movies = Movie.all
    @new = Movie.new(movie_params[:movie])
    @new.save
    render :index
  end

  def edit
    find_movie
    render :edit
  end

  def update
    find_movie
    params = movie_params[:movie]
    @movie.update(params)
    @movie.save
    redirect_to movie_path
  end

  def destroy
    find_movie
    @movie.destroy
    redirect_to movies_path
  end

  def upvote
    find_movie
    @movie.increment!(:vote)
    redirect_to movies_path
  end

  def downvote
    find_movie
    @movie.decrement!(:vote)
    redirect_to movies_path
  end


private
  def movie_params
    params.permit(movie: [:title, :director, :description, :vote])
  end

end
