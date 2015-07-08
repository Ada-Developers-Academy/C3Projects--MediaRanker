class AlbumsController < ApplicationController
  def index
    @albums = Album.all.rank_order
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if params[:album].nil? == true
      @album.rank += 1
      @album.save
    else
      @album.update(album_params)
    end

    render :show
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy

    redirect_to root_path
  end

  private

  def album_params
    params[:movie].permit(:title, :artist, :description, :rank)
  end
end
