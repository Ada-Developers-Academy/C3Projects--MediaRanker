class MediaController < ApplicationController
  def index
    @top_movies = Movie.top_rank(5)
    @top_books = Book.top_rank(5)
    @top_albums = Album.top_rank(5)
  end
end
