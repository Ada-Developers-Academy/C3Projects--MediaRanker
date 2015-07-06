class MoviesController < ApplicationController
  def index
    @movies = Medium.movies
  end
end
