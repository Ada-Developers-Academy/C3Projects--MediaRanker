class WelcomeController < ApplicationController
  def index
    @movies = Movie.all.rank_order_top
    @books = Book.all.rank_order_top
    @albums = Album.all.rank_order_top

    render :index
  end
end
