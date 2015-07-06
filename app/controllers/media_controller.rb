class MediaController < ApplicationController
  def index
    @top_movies = Movie.top_5
    @top_books = Book.top_5
    @top_albums = Album.top_5
  end
end
