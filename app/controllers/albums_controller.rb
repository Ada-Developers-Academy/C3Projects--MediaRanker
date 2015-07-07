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
    @media = Album.new
    @creator = :artist
  end

  def create
    album = Album.create(album_params)
    if album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
    @media = Album.find(params[:id])
    @creator = :artist
  end

  def update
    album = Album.find(params[:id])
    if album.update(album_params)
      redirect_to album_path(album)
    else
      render :edit
    end
  end

  def destroy

  end



  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end

end
