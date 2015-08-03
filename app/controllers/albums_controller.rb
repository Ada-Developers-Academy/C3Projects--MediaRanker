class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.rank_order
  end

  def show; end

  def edit
    @action = "Edit"
  end

  def update
    if params[:album].nil?
      @album.rank += 1
      @album.save
      render :show
    else
      if @album.update(album_params)
        render :show
      else
        @action = "Edit"
        render :edit
      end
    end
  end

  def destroy
    @album.destroy

    redirect_to albums_path
  end

  def new
    @album = Album.new
    @action = "New"
  end

  def create
    album = Album.create(album_params)

    if album.save
      redirect_to album_path(id: album.id)
    else
      @album = Album.new(album_params)
      @action = "New"
      render :new
    end
  end

  private

  def album_params
    params[:album].permit(:title, :artist, :description, :rank)
  end

  def set_album
    @album = Album.find(params[:id])
  end
end
