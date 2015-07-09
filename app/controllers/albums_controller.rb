class AlbumsController < ApplicationController
  def index
    @albums = Album.all.rank_order
    @media_type = "album"
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

  def new
    @album = Album.new
  end

  def create
    params[:album][:rank] = 0
    album = Album.create(album_params)
    
    redirect_to album_path(id: album.id)
  end

  private

  def album_params
    params[:album].permit(:title, :artist, :description, :rank)
  end
end
