class HomeController < ApplicationController
  def index
    @albums = Album.all
    @movies = Movie.all
    @books = Book.all
  end
end
