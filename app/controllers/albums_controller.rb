class AlbumsController < ApplicationController
  def index

  end

  def show
    @album = Album.find(params[:id])

  end
end
