class UsersController < ApplicationController
LIMIT = 4
  def index
    @movies = Movie.desc_order.limit(LIMIT)
    @books = Book.desc_order.limit(LIMIT)
    @albums = Album.desc_order.limit(LIMIT)
  end
end
