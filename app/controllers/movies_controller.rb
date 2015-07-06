class MoviesController < ApplicationController
  def index
    @movies = Medium.movies
  end

  def show
    @movie = Medium.find(params[:id])
  end
end
