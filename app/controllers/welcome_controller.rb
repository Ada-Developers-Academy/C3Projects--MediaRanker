class WelcomeController < ApplicationController

  def index
    @movies = Movie.ranking
    @books = Book.all
    @albums = Album.all
  end

end
