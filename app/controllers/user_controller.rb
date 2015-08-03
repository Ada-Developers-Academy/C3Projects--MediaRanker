class UserController < ApplicationController

  def index
    @movies = Movie.best

    @books = Book.best

    @albums = Album.best

    @media = [@movies, @books, @albums]
  end

end
