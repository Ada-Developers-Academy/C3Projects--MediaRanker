class AlbumsController < ApplicationController
  before_action :find_album, only: [:show, :edit, :update, :destroy]

  def self.model
    Album
  end

  def find_album #Extracts out this search into one method
    @album = Album.find(params[:id])
  end

  def index
    albums = Album.all
    count = albums.count
    @albums = Album.ranking(count)
  end

  def show

  end

  def upvote
    album = Album.find(params[:id])
    album.add_vote
    album.save

    redirect_to album_path
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(create_params[:album])

    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @album.update(create_params[:album])

    redirect_to album_path(@album)
  end

  def destroy
    @album.destroy

    redirect_to albums_path
  end

  private

  def create_params
    params.permit(album: [:name, :creator, :description, :rank])
  end

end
