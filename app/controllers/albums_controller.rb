class AlbumsController < ApplicationController
  before_action :set_medium, except: [:index, :new, :create]

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
      render 'shared/form'
    end
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
