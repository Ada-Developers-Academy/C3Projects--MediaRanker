class AlbumsController < ApplicationController
  def self.model
    Album
  end

  def index
    @albums = Album.all.order('ranking DESC')
  end

  def new
    @album = Album.new
  end

  def upvote
    @album = Album.find(params[:id])
    @album.ranking += 1
    @album.save

    render :show, medium: @album
  end

  def create
    album = Album.new(create_params[:album])
    album.save # opportunity for validity checks

    redirect_to album_path(album)
  end

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
