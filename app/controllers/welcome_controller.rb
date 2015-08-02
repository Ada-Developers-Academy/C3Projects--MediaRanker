class WelcomeController < ApplicationController

  TOP_RANKING = 10

  def index
    @movies = Movie.best_first(TOP_RANKING)
    @books = Book.best_first(TOP_RANKING)
    @albums = Album.best_first(TOP_RANKING)
  end

end
