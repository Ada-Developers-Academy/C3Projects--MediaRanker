class AlbumsController < ApplicationController
  before_action :find_album, except: [:index, :create, :new]

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
    @single.update(album_params)
    @single.save

    redirect_to album_path(@single.id)
  end

  def upvote
    # self.vote
    @single.increment!(:rank)
    @single.save
    redirect_to :album
  end

  def destroy
    @single.destroy

    redirect_to :albums
  end

  def self.model
    Album
  end
# PRIVATE METHODS ----------------------------------------------------------
private

  def find_album
    @single = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:id, :name, :creator, :description, :rank)
  end

end
