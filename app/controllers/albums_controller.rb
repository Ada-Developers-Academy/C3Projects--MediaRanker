class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(permit_params)

    super
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id]).update(permit_params)

    super
  end

  def destroy
    @album = Album.find(params[:id]).destroy

    super
  end

  def upvote
    @album = Album.find(params[:id])
    votes = @album.rank
    votes += 1
    @album.update(rank: votes)

    super
  end

  private

  def permit_params
    params.require(:album).permit(:name, :artist, :description)
  end

end
