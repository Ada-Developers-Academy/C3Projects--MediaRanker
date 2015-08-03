class AlbumsController < ApplicationController
  before_action :find_album, only: [ :show, :edit, :update, :destroy, :upvote ]

  def self.model
    Album
  end

  def index
    @albums = Album.all.rank_order
  end

  def show; end

  def edit; end

  def update
    @album.update(create_params[:album])

    redirect_to album_path(@album.id)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(create_params[:album])
    @album.rank = 0

    if @album.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
  end

  def destroy
    @album.destroy

    redirect_to albums_path
  end

  def upvote
    @album.rank += 1
    @album.save

    redirect_to album_path(@album.id)
  end

  private

  def create_params
    params.permit(album: [:title, :artist, :rank, :description])
  end

  def find_album
    @album = Album.find(params[:id])
  end

end
