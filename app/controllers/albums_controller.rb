class AlbumsController < ApplicationController

  before_action :find_album, except: [:index, :new, :create]

  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new
  end

  def create
    params = album_params[:album]
    @album = Album.new(params)

    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @album.update(album_params[:album])

    redirect_to album_path(params[:id])
  end

  def destroy
    @album.destroy

    redirect_to '/albums'    
  end

  def upvote
    @album.rank += 1
    @album.save

    redirect_to album_path(params[:id])
  end


##################### PRIVATE METHODS #####################
  private

  def album_params
    params.permit(album: [:id, :name, :artist, :description, :rank])
  end

  def find_album
    @album = Album.find(params[:id])
  end
  
end
