class WelcomeController < ApplicationController
  def index
    @movies = Movie.all
    @albums = Album.all
    @books = Book.all
    render :index
  end
end
