class WelcomeController < ApplicationController

  TOP_LIMIT = 3

  def index
    @top_albums = Album.top(TOP_LIMIT)
    @top_books = Book.top(TOP_LIMIT)
    @top_movies = Movie.top(TOP_LIMIT)
  end
end
