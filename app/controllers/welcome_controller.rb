class WelcomeController < ApplicationController
  def index
    @movies = Medium.best_movies(5)
    @books = Medium.best_books(5)
    @albums = Medium.best_albums(5)
  end
end
