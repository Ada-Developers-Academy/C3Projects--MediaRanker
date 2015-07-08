class WelcomeController < ApplicationController
  def index
    @movies = Movie.all.rank_order
    @books = Book.all.rank_order
    @albums = Album.all.rank_order

    render :index
  end
end
