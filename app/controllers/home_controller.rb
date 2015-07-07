class HomeController < ApplicationController
  def index
    @albums = Album.all
    @movies = Movie.all
    @books = Book.all
    @all_media = [@albums, @movies, @books]
  end
end
