class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  # private

  # def movie_params
  #   params.require(:medium).permit(:title, :creator, :description, :format, 
  #     :rank)
  # end
end
