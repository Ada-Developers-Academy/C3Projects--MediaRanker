class AlbumsController < ApplicationController

  def index
    @albums = Album.ranking
  end

  def show
    @album = Album.find(params[:id])
  end

  def upvote
    album = Album.find(params[:id])
    album.rank += 1
    album.save

    redirect_to album_path
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(create_params[:album])
    @album.rank = 0
    @album.save

    redirect_to album_path(@album)
  end

  private

  def create_params
    params.permit(album: [:name, :artist, :description, :rank])
  end

end
