class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :upvote, :destroy]

  def index
    @albums = Album.all_ranked
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    if @album.save
      redirect_to @album
    else
      render :new  
    end
  end

  def update
    @album.update(album_params)
    if @album.save
      redirect_to @album
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

  def album_params
    params.require(:album).permit(:title, :artist, :description, :rank)
  end
end
