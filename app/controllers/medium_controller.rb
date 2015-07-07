class MediumController < ApplicationController
  def index
    @books  = Book.best(10)
    @movies = Movie.best(10)
    @albums = Album.best(10)
  end
end
