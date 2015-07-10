class AlbumsController < ApplicationController

  before_action :find_and_set_media, only: [:upvote, :show, :edit, :update, :destroy]

  def index
    @media = Album.all.order(rank: :desc)
    @new_media = Album.new
    @add_media = "an Album"
  end

  def upvote
    @media.increment!(:rank)
    redirect_to album_path(@media)
  end

  def show
    @created = "Recorded"
    @creator = @media.artist
    @format = "Albums"
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
    @creator = :artist
  end

  def update
    @creator = :artist
    if @media.update(album_params)
      redirect_to album_path(@media)
    else
      render :edit
    end
  end

  def destroy
    @media.destroy
    redirect_to polymorphic_path(Album)
  end



  private

  def find_and_set_media
    @media = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end

end
