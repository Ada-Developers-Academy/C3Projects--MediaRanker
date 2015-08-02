class AlbumsController < ApplicationController

  before_action :find_album, except: [:index, :new, :create, :destroy]

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

  end

  def edit

  end

  def update
    @album.update(create_params[:album])

    redirect_to album_path(@album.id)
  end

  def upvote
    @album.rank += 1

    @album.save

    redirect_to(:back) rescue redirect_to album_path
  end

  def destroy
    album = Album.destroy(params[:id])

    redirect_to albums_path
  end

  private

  def create_params
    params.permit(album: [:name, :artist, :description, :rank])
  end

  def find_album
    @album = Album.find(params[:id])
  end
end
