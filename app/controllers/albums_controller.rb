class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @media = Album.new
    @url = albums_path
    @method = :post
    @by = :artist
  end

  def create
    @media = Album.create(album_params)
    @by = :artist
    if @media.save
      redirect_to albums_path
    else
      # @media.validate_or_msg
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @media = Album.find(params[:id])
    @url = album_path
    @method = :patch
    @by = :artist
  end

  def update
    @media = Album.find(params[:id])
    @media.update(album_params)
    @media.save
    redirect_to albums_path
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to albums_path
  end

private

  def album_params
    params.require(:album).permit(:title, :author, :description, :ranking)
  end

end
