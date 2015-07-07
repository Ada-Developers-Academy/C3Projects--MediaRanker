class WelcomeController < ApplicationController

  def index
    @movies = Movie.ranking(5)
    @books = Book.ranking(5)
    @albums = Album.ranking(5)
  end

end
