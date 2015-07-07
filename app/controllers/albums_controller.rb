class AlbumsController < ApplicationController

  def index
    @albums = Album.all

    @albums = @albums.order('rank DESC')
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(create_params[:album])

    redirect_to albums_path
  end

  def show
    @album = Album.find(params[:id])

  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    @album.update(create_params[:album])

    redirect_to album_path(@album.id)
  end

  def destroy
    @album = Album.destroy(params[:id])

    redirect_to albums_path
  end

  private

  def create_params
    params.permit(album: [:name, :artist, :description, :rank])
  end
end
