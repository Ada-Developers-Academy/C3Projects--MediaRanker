class AlbumsController < ApplicationController
  def index
    @media = Album.all.order(rank: :desc)
    @new_media = Album.new
    @add_media = "an Album"
  end

  def upvote
    @album = Album.find(params[:id])
    @album.increment!(:rank)
    redirect_to album_path(@album)
  end

  def show
    @media = Album.find(params[:id])
    @created = "Recorded"
    @creator = @media.artist
    @format = "Albums"
    @class = Album
  end

  def new
    @media = Album.new
    @creator = :artist
  end

  def create
    @media = Album.create(album_params)
    @creator = :artist
    if @media.save
      redirect_to album_path(@media)
    else
      render :new
    end
  end

  def edit
    @media = Album.find(params[:id])
    @creator = :artist
  end

  def update
    @media = Album.find(params[:id])
    @creator = :artist
    if @media.update(album_params)
      redirect_to album_path(@media)
    else
      render :edit
    end
  end

  def destroy

  end



  private

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end

end
