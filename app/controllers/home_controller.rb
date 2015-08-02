class HomeController < ApplicationController

  def index
    @movies = Movie.all.top
    @books = Book.all.top
    @albums = Album.all.top
  end

end
