class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    updated_album = create_params[:album]
    # opportunity for .valid? and error handling
    album.update(updated_album)

    redirect_to album_path(album)
  end

  private

  def create_params
    params.permit(album: [:title, :artist, :description])
  end
end
