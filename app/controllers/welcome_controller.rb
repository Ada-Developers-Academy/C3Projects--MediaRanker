class WelcomeController < ApplicationController
  def index
    @movies = Movie.all
    @books = Book.all
    @albums = Album.all
    
    render :index
  end
end
