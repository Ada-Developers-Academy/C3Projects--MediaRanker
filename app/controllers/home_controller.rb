class HomeController < ApplicationController
  def index
    @books = Book.top_ranked
    @movies = Movie.top_ranked
    @albums = Album.top_ranked
  end
end
