class WelcomeController < ApplicationController
  DEFAULT_NUM_MEDIA = 5

  def index
    @movies = Medium.best_movies(DEFAULT_NUM_MEDIA)
    @books = Medium.best_books(DEFAULT_NUM_MEDIA)
    @albums = Medium.best_albums(DEFAULT_NUM_MEDIA)
  end
end
