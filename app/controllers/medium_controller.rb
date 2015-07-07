class MediumController < ApplicationController
  def index
    @books  = Book.all
    @movies = Movie.all
    @albums = Album.all
  end
end
