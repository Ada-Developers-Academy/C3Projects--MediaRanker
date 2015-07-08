class AlbumsController < ApplicationController
  before_action :set_album, only: [:update, :show]

  def index
    @albums = Album.all
  end

  def update
    if params[:upvote] == "true"
      Album.upvote(@album)
      redirect_to album_path(@album)
    else
      render :index
    end
  end

  def show
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end
end
