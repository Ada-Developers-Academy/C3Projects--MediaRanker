class WelcomeController < ApplicationController

  def index
    @movies = Movie.ranking(10)
    @books = Book.ranking(10)
    @albums = Album.ranking(10)
  end

end
