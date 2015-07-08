class MoviesController < ApplicationController
  def index
    @movies = Medium.movies.all_rank
  end
end
