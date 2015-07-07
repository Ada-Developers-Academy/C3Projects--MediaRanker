class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    @album.save
    redirect_to albums_path
  end


private

  def album_params
    params.require(:album).permit(:title, :author, :description)
  end

end
