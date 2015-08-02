class AlbumsController < ApplicationController
  before_action :set_album, only: [:update, :show, :destroy, :edit]

  def self.model
    Album
  end

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:upvote] == "true"
      Album.upvote(@album)
      redirect_to album_path(@album)
    else
      if @album.update(album_params)
        redirect_to album_path(@album)
      else
        render :edit
      end
    end
  end

  def show
  end

  def destroy
    @album.destroy

    redirect_to albums_path
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :recorded_by, :description)
  end
end
