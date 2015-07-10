class AlbumsController < ApplicationController
  before_action :find_album, only: [:upvote, :show, :edit, :update, :destroy]

  def self.model
    Album
  end

  def find_album
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.all.order('ranking DESC')
    @album = Album.new
  end

  def new
    @album = Album.new
  end

  def upvote
    @album.ranking += 1
    @album.save

    render :show, medium: @album
  end

  def create
    album = Album.new(create_params[:album])
    album.save # opportunity for validity checks

    redirect_to album_path(album)
  end

  def show; end

  def edit; end

  def update
    updated_album = create_params[:album]
    # opportunity for .valid? and error handling
    @album.update(updated_album)

    redirect_to album_path(@album)
  end

  def destroy
    @album.destroy
    redirect_to media_path
  end

  private

  def create_params
    params.permit(album: [:title, :artist, :description])
  end
end
