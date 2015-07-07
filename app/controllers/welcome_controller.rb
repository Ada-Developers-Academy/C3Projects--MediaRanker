class WelcomeController < ApplicationController

  def index
    @movies = Movie.ranking
    @books = Book.ranking
    @albums = Album.ranking
  end

end
