class AlbumsController < ApplicationController

  def index
    @all = Album.all
    @controller = "albums"
  end

  def show
    find_album
    @controller = "albums"
  end

private

  def find_album
    @single = Album.find(create_params[:id])
  end

  def find_market
        id = params[:id]
        @market = Market.find(id)
    end

  def create_params
    params.permit(:id, album: [:id, :name, :artist, :description, :rank])
  end

end
