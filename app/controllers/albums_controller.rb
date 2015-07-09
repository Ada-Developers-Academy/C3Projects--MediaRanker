class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :upvote, :destroy]
  before_action :set_medium, only: [:edit, :update]


  def index
    @albums = Album.all_ranked
  end

  def new
    @medium = Album.new
  end

  def create
    @medium = Album.create(album_params)
    if @medium.save
      redirect_to @medium
    else
      render :new  
    end
  end

  def update
    @medium.update(album_params)
    if @medium.save
      redirect_to @medium
    else
      render :edit
    end
  end

  def upvote
    @album.add_vote
    
    redirect_to @album
  end

  def destroy
    @album.destroy

    redirect_to albums_path
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def set_medium
    @medium = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :creator, :description, :rank)
  end
end
