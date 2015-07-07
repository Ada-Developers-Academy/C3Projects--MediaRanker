class HomeController < ApplicationController
  def index
    @books = Medium.books
    @movies = Medium.movies
    @albums = Medium.albums
  end
end
