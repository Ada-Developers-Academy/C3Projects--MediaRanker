class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(create_params[:album])
    @album.save

    render :show
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
      new_name = params[:album][:name]
      new_artist = params[:album][:artist]
      new_description = params[:album][:description]

    @album.update(name: new_name,
                 artist: new_artist,
                 description: new_description)
    @albums = Album.all

    render :show
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to action: :index
  end

  private

  def create_params
    params.permit(album: [:name, :artist, :description])
  end
end
