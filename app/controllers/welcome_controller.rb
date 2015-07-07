class WelcomeController < ApplicationController

  def index
    @all_movies = Movie.all
    @all_books = Book.all
    @all_albums = Album.all

  end

end
