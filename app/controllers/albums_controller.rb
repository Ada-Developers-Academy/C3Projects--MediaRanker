class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @medium = Album.new
  end

  def create
    album = Album.create(album_params)

    redirect_to album
  end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :description, :rank)
  end
end
