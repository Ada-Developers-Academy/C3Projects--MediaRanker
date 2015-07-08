class HomeController < ApplicationController
  def index
    @books = Book.all_ranked
    @movies = Movie.all_ranked
    @albums = Album.all_ranked
  end
end
