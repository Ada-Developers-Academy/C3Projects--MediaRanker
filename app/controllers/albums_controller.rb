class AlbumsController < ApplicationController
  before_action :find, except [:index, :new, :create]

  def find
    @media = Album.find(params[:id])
  end

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

  def show;  end

  def edit
    @url = album_path
    @method = :patch
    @by = :artist
  end

  def update
    @by = :artist
    @media.update(album_params)
    if @media.save
      redirect_to album_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @media.destroy
    redirect_to albums_path
  end

  def vote
    @media.ranking += 1
    @media.save
    redirect_to albums_path
  end

private

  def album_params
    params.require(:album).permit(:title, :author, :description, :ranking)
  end

end
