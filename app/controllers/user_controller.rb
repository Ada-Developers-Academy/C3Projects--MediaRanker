class UserController < ApplicationController

  def index
    @movies = Movie.all

    @books = Book.all

    @albums = Album.all
  end
end
