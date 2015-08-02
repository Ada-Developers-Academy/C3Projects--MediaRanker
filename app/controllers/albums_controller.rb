class AlbumsController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :upvote, :destroy]

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
    render 'shared/form'
  end

  def update
    @medium.update(album_params)
    if @medium.save
      redirect_to @medium
    else
      render :edit
    end
  end

  def show
    render 'shared/show'
  end

  def upvote
    @medium.add_vote
    
    redirect_to @medium
  end

  def destroy
    @medium.destroy

    redirect_to albums_path
  end

  private

  def set_medium
    @medium = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :creator, :description, :rank)
  end

  def self.model
    Album
  end
end
