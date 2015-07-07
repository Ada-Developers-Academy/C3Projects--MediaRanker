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

  def upvote
    @medium = Medium.find(params[:id])
    @medium.ranking += 1
    @medium.save
    redirect_to(medium_path)
  end
end
