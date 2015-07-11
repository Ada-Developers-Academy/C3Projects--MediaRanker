class AlbumsController < ApplicationController

  def index
    @media = Album.all.order(rank: :desc)
    # defining medium allows me to use polymorphic paths for new from the index page
    @medium = Album.new
  end

  def show
    @media = Album.find(params[:id])
  end

    def new
    @media = Album.new
    end

  def create
    @media = Album.new(create_params[:album])
    @media.save
    redirect_to album_path(@media)
  end

  def edit
    @media = Album.find(params[:id])
  end

  def update
    @media = Album.find(params[:id])
    @media.update(create_params[:album])
    redirect_to album_path(@media)
  end

  def destroy
    @media = Album.find(params[:id])
    @media.destroy
    redirect_to albums_path
  end

  def upvote
    @media = Album.find(params[:id])
    @media.add_a_vote
    @media.save
    render :show
  end

  private

  def create_params
    params.permit(album: [:name, :creator, :description, :rank])
  end


end
