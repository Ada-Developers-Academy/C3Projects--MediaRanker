class AlbumsController < ApplicationController

  def index
    @albums = Album.all
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

    redirect_to album_path(params[:id])
  end

##################### PRIVATE METHODS #####################
  private

  def create_params
    params.permit(album: [:id, :name, :artist, :description, :rank])
  end
  
end
