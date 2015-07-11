class AlbumsController < ApplicationController

  before_action :get_album, only: [:show, :edit, :update, :upvote, :destroy]

  def get_album
    @album = Album.find(params[:id])
  end

  # Show album(s)
  def index
    @albums = Album.order(:name)
  end

  def show
  end

  # Add an album
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  # Edit an album
  def edit
  end

  def update
    @album.update(album_params)

    redirect_to album_path
  end

  # Upvote an album
  def upvote
    @album.vote += 1
    @album.save

    redirect_to :back rescue redirect_to album_path
  end

  # Delete an album
  def destroy
    @album.destroy

    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :artist, :desc)
  end

end
