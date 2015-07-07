class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
  end

  def index
   @albums = Album.all
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to '/albums'
  end
end
