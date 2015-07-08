class MoviesController < ApplicationController
  def index
    @movies = Movie.all.rank_order
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

  private

  def movie_params
    params[:movie].permit(:title, :director, :description, :rank)
  end
end
