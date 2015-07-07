class WelcomeController < ApplicationController
  def index
    @top_albums = Album.top
    @top_books = Book.top
    @top_movies = Movie.top
  end
end
