class AlbumsController < ApplicationController
  before_action :find_album, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @albums = Album.desc_order
  end

  def show
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(create_params[:album])
    @album.ranking = 0

    if @album.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @album.update(create_params[:album])

    if @album.save
      redirect_to album_path(@album.id)
    else
      render :edit
    end
  end

  def destroy
    @album.destroy

    redirect_to albums_path
  end

  def upvote
    @album.ranking += 1
    @album.save

    redirect_to album_path(@album.id)
  end

  # ______________________________________________________________________
  private

  def create_params
    params.permit(album: [:name, :artist, :description, :ranking])
  end

  def find_album
    @album = Album.find(params[:id])
  end
end
