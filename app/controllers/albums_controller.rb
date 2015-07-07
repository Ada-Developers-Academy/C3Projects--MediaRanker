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

private

  def find_album
    @album = Album.find(create_params[:id])
  end

  def create_params
    params.permit(:id, album: [:id, :name, :creator, :description, :rank])
  end

end
