class AlbumsController < ApplicationController

  def index
    @albums = Album.ranking
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    album.rank += 1
    album.save

    redirect_to album_path
  end

end
