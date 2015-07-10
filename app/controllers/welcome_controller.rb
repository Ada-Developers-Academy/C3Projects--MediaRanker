class WelcomeController < ApplicationController
  def index
    @top_movies = Movie.all.top(10)
    @top_books = Book.all.top(10)
    @top_albums = Album.all.top(10)
  end
end
