class WelcomeController < ApplicationController
  NUMBER_OF_BEST = 5

  def index
    @books = Book.best(NUMBER_OF_BEST)
    @movies = Movie.best(NUMBER_OF_BEST)
    @albums = Album.best(NUMBER_OF_BEST)

    @media = [ @movies, @books, @albums ]
  end
end
