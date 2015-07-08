class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
    @method = :post
  end

  def create
    @album = Album.create(album_params)
  end


  def update
  end

  def show
    @album = Album.find(params[:id])
    @edit_path = edit_album_path(@album.id)
    @index_path = albums_path
  end

  def upvote
    album = Album.find(params[:id])
    album.votes += 1
  end

  def album_params
    params.require(:album).permit(:name, :description, :artist, :votes)
  end
end
