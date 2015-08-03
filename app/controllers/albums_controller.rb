class AlbumsController < ApplicationController

  before_action :find_and_set_media, only: [:upvote, :show, :edit, :update, :destroy]
  before_action :set_creator, only: [:show, :new, :create, :edit, :update]

  def index
    @media = Album.ranked
    @new_media = Album.new
    @add_media = "an Album"
  end

  def upvote
    @media.increment!(:rank)
    redirect_to album_path(@media)
  end

  def show
    @created = "Recorded"
    @creator = :artist
    @format = "Albums"
  end

  def new
    @media = Album.new
  end

  def create
    @media = Album.create(album_params)
    if @media.save
      redirect_to album_path(@media)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @media.update(album_params)
      redirect_to album_path(@media)
    else
      render :edit
    end
  end

  def destroy
    @media.destroy
    redirect_to albums_path
  end


  private

  def find_and_set_media
    @media = Album.find(params[:id])
  end

  def set_creator
    @creator = :artist
  end

  def album_params
    params.require(:album).permit(:name, :artist, :description)
  end

end
