class AlbumsController < ApplicationController
  before_action :find_album, only: [:show, :edit, :update, :upvote, :destroy]

  def index
    @model = Album
  end

  def show
  end

  def new
    @single = Album.new
  end

  def create
    @single = Album.create(album_params)

    if @single.save
      redirect_to album_path(@single.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @single = find_album
    @single.update(album_params)
    @single.save

    redirect_to album_path(@single.id)
  end

  def upvote
    @single.increment!(:rank)
    @single.save
    redirect_to :album
  end

  def destroy
    @single.destroy

    redirect_to :albums
  end

# PRIVATE METHODS ----------------------------------------------------------
private
  def self.model
    Album
  end

  def find_album
    @single = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:id, :name, :creator, :description, :rank)
  end

end
