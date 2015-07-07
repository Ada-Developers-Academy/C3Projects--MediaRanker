class WelcomeController < ApplicationController
  def index
    @top_movies = Movie.all.top(5)
    @top_books = Book.all.top(5)
    @top_albums = Album.all.top(5)
  end
end
