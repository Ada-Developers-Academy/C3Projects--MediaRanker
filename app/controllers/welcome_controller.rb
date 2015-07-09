class WelcomeController < ApplicationController
  def index
    @movies = Movie.all.rank_order_top_ten
    @books = Book.all.rank_order_top_ten
    @albums = Album.all.rank_order_top_ten

    @media = [ @movies, @books, @albums ]

    render :index
  end
end
