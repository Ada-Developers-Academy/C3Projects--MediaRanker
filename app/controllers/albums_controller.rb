class AlbumsController < ApplicationController
  def index
    @albums = Album.rank_order
    @media_type = "album"
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
    @action = "Edit"
  end

  def update
    @album = Album.find(params[:id])

    if params[:album].nil? == true
      @album.rank += 1
      @album.save
      render :show
    else
      @album.update(album_params)
      if @album.save
        render :show
      else
        @action = "Edit"
        render :edit
      end
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy

    redirect_to albums_path
  end

  def new
    @album = Album.new
    @action = "New"
  end

  def create
    album = Album.create(album_params)

    if album.save
      redirect_to album_path(id: album.id)
    else
      @album = Album.new(album_params)
      @action = "New"
      render :new
    end
  end

  private

  def album_params
    params[:album].permit(:title, :artist, :description, :rank)
  end
end
