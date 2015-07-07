class MoviesController < ApplicationController

  def index
    @media = Movie.all.order(rank: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
