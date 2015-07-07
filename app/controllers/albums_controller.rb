class AlbumsController < ApplicationController

  def index
   @albums = Album.all
  end

  def edit
    @album = Album.find(params[:id])
  end
  
  def show
    @album = Album.find(params[:id])
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to '/albums'
  end
end
