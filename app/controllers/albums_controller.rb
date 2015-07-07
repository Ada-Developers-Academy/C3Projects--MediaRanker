class AlbumsController < ApplicationController

  def index
    @all = Album.all
    @controller = "albums"
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
    redirect_to "/albums/#{@album.id}"
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

    redirect_to root_path
  end


# PRIVATE METHODS ----------------------------------------------------------
private

  def find_album
    @album = Album.find(create_params[:id])
  end

  def create_params
    params.permit(:id, album: [:id, :name, :creator, :description, :rank])
  end

end
