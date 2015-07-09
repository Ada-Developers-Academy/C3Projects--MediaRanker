class AlbumsController < ApplicationController
  before_action :set_album, only: [:update, :show]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(create_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def update
    if params[:upvote] == "true"
      Album.upvote(@album)
      redirect_to album_path(@album)
    else
      render :index
    end
  end

  def show
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end

  def create_params
    params.require(:album).permit(:title, :recorded_by, :description)
  end
end
