class MoviesController < ApplicationController
  def index

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)

    render :show
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy

    redirect_to root_path
  end

  private

  def movie_params
    params[:movie].permit(:title, :director, :description)
  end
end
