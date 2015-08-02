class WelcomeController < ApplicationController
  def index
    @movies = Movie.best(5)
    @books = Book.best(5)
    @albums = Album.best(5)

    render :index
  end
end

