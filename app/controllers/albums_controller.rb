class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    show
  end

  def update
    show
    @album.update(create_params[:album])

    redirect_to album_path(@album.id)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(create_params[:album])
    @album.rank = 0
    @album.save

    if @album.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  def destroy
    show
    @album.destroy

    redirect_to albums_path
  end

  def upvote
    show
    @album.rank += 1
    @album.save

    redirect_to album_path(@album.id)
  end

  private

  def create_params
    params.permit(album: [:title, :artist, :rank, :description])
  end

end
