class MoviesController < ApplicationController

  def index
   @movies = Movie.ordered
   # I called a scope called 'ordered' to have all the movies listed in order
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(create_params[:movie])
    @movie.rank = 0

    if @movie.save
      render :show
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(edit_params[:movie])
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :edit # if the edit doesn't save due to a missing required field from the user, then it will render the edit page with the params
    end
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.rank += 1
    @movie.save
    redirect_to movie_path(@movie.id)
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path
  end

  private

  def edit_params
    params.permit(movie: [:name, :director, :description])
  end

  def create_params
    params.permit(movie: [:name, :director, :description])
  end

end
