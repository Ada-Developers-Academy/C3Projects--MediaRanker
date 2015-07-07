class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def upvote
    @album = Album.find(params[:id])
    @album.increment!(:rank)
    redirect_to album_path(@album)
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    Album.create(album_params)
    redirect_to albums_path
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update

  end

  def destroy

  end



  private

  def album_params
    params.require(:album).permit(:name, :artist, :description, :rank)
  end

end
