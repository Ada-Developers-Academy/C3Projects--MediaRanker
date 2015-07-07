class UserController < ApplicationController

  def index
    @movies = Movie.best

    @books = Book.best

    @albums = Album.best
  end

end
