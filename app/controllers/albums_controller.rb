class AlbumsController < ApplicationController

  def index
    @albums = Album.best_first_all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(permit_params)
    @album.rank = 0
    if @album.save
      super
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(permit_params)
      super
    else
      render :edit
    end
  end

  def destroy
    Album.find(params[:id]).destroy

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
