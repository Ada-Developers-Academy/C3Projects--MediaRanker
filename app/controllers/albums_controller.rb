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
    @album.ranking = 0

    if @album.save
      redirect_to album_path(@album.id)
    else
      render :new
    end
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

    if @album.save
       redirect_to album_path(@album.id)
    else
      render :edit
    end
  end

  def destroy
    show
    @album.destroy

    redirect_to albums_path
  end

  def upvote
    show
    @album.ranking += 1
    @album.save

    redirect_to album_path(@album.id)
  end

  # ______________________________________________________________________
  private

  def create_params
    params.permit(album: [:name, :artist, :description, :ranking])
  end
end
