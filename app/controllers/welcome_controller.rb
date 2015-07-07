class WelcomeController < ApplicationController
  def index
    @books = Book.best(5)
    @movies = Movie.best(5)
    @albums = Album.best(5)
  end
end
