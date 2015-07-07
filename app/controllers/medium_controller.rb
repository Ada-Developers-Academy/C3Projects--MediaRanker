class MediumController < ApplicationController
  def index
    @books  = Book.all.order(vote: :desc)
    @movies = Movie.all.order(vote: :desc)
    @albums = Album.all.order(vote: :desc)
  end
end
