class WelcomeController < ApplicationController
  def index
    @movies = Movie.all
    @albums = Album.all
    render :index
  end
end
