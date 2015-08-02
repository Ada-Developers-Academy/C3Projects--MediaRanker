class AlbumsController < ApplicationController
  before_action :set_album, only: [:edit, :show, :update, :destroy]

  def self.model
    Album
  end

  def index
    @albums = Album.ranking_order
  end

  def create
    @album = Album.create(create_params)

    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def new
    @album = Album.new
  end

  def edit; end

  def show; end

  def update
    if params[:album]
      @album.update(create_params)

      if @album.save
        redirect_to album_path(@album)
      else
        render :edit
      end

    else
      @album.ranking += 1
      @album.save
      redirect_to album_path(@album)
    end
  end

  def destroy
    @album.destroy

    redirect_to albums_path
  end

private

  def create_params
    params.require(:album).permit(:name, :artist, :description, :ranking)
  end

  def set_album
    @album = Album.find(params[:id])
  end
end
