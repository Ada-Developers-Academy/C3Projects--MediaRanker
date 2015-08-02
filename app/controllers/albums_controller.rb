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
    params = create_params[:album]
    params[:rank] = 0
    @album = Album.new(params)

    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    @album.update(create_params[:album])

    redirect_to album_path(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to '/albums'    
  end

  def upvote
    @album = Album.find(params[:id])
    @album.rank += 1
    @album.save

    redirect_to album_path(params[:id])
  end


##################### PRIVATE METHODS #####################
  private

  def create_params
    params.permit(album: [:id, :name, :artist, :description, :rank])
  end
  
end
