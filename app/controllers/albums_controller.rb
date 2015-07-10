class AlbumsController < ApplicationController
  # make a before_action for find_album
  
  def self.model
    Album
  end

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
    @album = Album.create(create_params[:album])

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
    @single.update(create_params[:album])
    @single.save

    redirect_to "/albums/#{@album.id}"
  end

  def upvote
    @single = find_album
    @single.rank += 1
    @single.save


    redirect_to :album
    # need to redirect to 2 different pages
  end

  def destroy
    @single = find_album
    @single.destroy

    redirect_to :albums
  end


# PRIVATE METHODS ----------------------------------------------------------
private

  def find_album
    @album = Album.find(create_params[:id])
  end

# change params for proper
  def create_params
    params.permit(:id, album: [:id, :name, :creator, :description, :rank])
  end

end
