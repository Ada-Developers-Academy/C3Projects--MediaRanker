class AlbumsController < ApplicationController

  before_action :get_album, only: [:show, :edit, :update, :upvote, :destroy]

  def get_album
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.all
  end

  def show
  end

  def update
    @album.update(album_params)

    redirect_to album_path
  end

  def upvote
    @album.vote += 1
    @album.save

    redirect_to album_path
  end

  def edit
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :desc)
  end

end
