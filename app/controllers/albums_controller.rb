class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :upvote, :destroy]

  def index
    @media = Album.ranked
    render 'shared/index'
  end

  def new
    @medium = Album.new
    render 'shared/form'
  end

  def create
    @album = Album.create(album_params)
    if @album.save
      redirect_to @album
    else
      render :new  
    end
  end

  def edit
    @medium = @album
    render 'shared/form'
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
    params.require(:album).permit(:title, :creator, :description, :rank)
  end

  def self.model
    Album
  end
end
