class AlbumsController < ApplicationController
  # make a before_action for find_album

  def index
    @controller = "albums"
    @model = Album
  end

  def show
    @single = find_album
    @controller = "albums"
    @creator = "Recorded by"
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)

    if @album.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  def edit
    @single = find_album
  end

  def update
    @single = find_album
    @single.update(album_params)
    @single.save

    redirect_to "/albums/#{@album.id}"
  end

  def upvote
    @single = find_album
    @single.increment!(:rank)
    @single.save
    redirect_to :album
  end

  def destroy
    @single = find_album
    @single.destroy

    redirect_to :albums
  end


# PRIVATE METHODS ----------------------------------------------------------
private
  def self.model
    Album
  end

  def find_album
    @album = Album.find(params[:id])
  end

# change params for proper
  def album_params
    params.require(:album).permit(:id, :name, :creator, :description, :rank)
  end

end
