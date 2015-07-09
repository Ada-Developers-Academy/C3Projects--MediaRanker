class HomeController < ApplicationController
  def home
    @movies = Medium.find_movies
    @books = Medium.find_books
    @albums = Medium.find_albums
  end
end
