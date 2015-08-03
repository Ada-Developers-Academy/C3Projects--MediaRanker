class AlbumsController < ApplicationController
  before_action :find_album, except: [:index, :new, :create]

  def index
   @albums = Album.ordered
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params[:album])

    if @album.save
      render :show
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    @album.update(album_params[:album])
    if @album.save
      redirect_to album_path(@album.id)
    else
      render :edit
    end
  end

  def upvote
    Album.upvote(@album)
    redirect_to album_path(@album.id)
  end

  def destroy
    @album.destroy
    redirect_to '/albums'
  end

  private

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.permit(album: [:name, :artist, :description])
  end

end
