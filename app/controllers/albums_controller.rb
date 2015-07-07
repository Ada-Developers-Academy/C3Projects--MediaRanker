class AlbumsController < ApplicationController
  def index
    @albums = Medium.albums
  end

  def show
    @album = Medium.find(params[:id])
  end
end
