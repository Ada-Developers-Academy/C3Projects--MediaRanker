class WelcomeController < ApplicationController

  def index
    @movies = Movie.top
    @books = Book.top
    @albums = Album.top
  end

end
