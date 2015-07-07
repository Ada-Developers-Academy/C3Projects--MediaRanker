class MediaController < ApplicationController
  def index
    @movies = Medium.movies
    @books = Medium.books
    @albums = Medium.albums
  end

  def show
    @medium = Medium.find(params[:id])
    @type = @medium.media_type
  end
end
