class HomeController < ApplicationController
  def index
    @movies = Movie.all
    @books = Book.all
    @albums = Album.all
  end
end
