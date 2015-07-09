class AlbumsController < ApplicationController

  def index
    @media = Album.all.order(rank: :desc)
  end

  def show
    @media = Album.find(params[:id])
  end

    def new
    @album = Album.new
    end

  def create
    @album = Album.new(create_params[:album])
    @album.save
    redirect_to album_path(@album)
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update(create_params[:album])
    redirect_to album_path(@album)
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  def upvote
    @album = Album.find(params[:id])
    @album.add_a_vote
    @album.save
    render :show
  end

  private

  def create_params
    params.permit(album: [:name, :creator, :description, :rank])
  end


end
