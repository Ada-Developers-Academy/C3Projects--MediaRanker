class MoviesController < ApplicationController

  def index
    @all = Movie.all
    @controller = "movies"
  end

private

  def create_params
    params.permit(single: [:id, :name, :director, :description, :rank])
  end

end
