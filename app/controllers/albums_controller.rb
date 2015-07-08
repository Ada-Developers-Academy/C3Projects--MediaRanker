class AlbumsController < ApplicationController

  def index
   @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(create_params[:album])
    @album.rank = 0

    if @album.save
      render :show
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    name_input = params[:album][:name]
    artist_input = params[:album][:artist]
    description_input = params[:album][:description]

    @album.update(name: name_input, artist: artist_input, description: description_input)
    if @album.save
      redirect_to albums_path(@album.id)
    else
      render :edit
    end
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to '/albums'
  end

private

  def edit_params
    params.permit(album: [:name, :artist, :description])
  end

  def create_params
    params.permit(album: [:name, :artist, :description])
  end

end
