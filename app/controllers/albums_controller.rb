class AlbumsController < ApplicationController
  def index
    @albums = Album.all.order('ranking DESC')
  end

  def create
    @new_album = Album.create(create_params[:album])
    @new_album.save

    redirect_to album_path(@new_album.id)
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if params[:album]
      new_name        = params[:album][:name]
      new_artist      = params[:album][:artist]
      new_description = params[:album][:description]

      @album.update(           name: new_name,
                             artist: new_artist,
                        description: new_description
      )
    else
      new_ranking = @album.ranking + 1
      @album.update(ranking: new_ranking)
    end

    redirect_to album_path(@album.id)
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_path
  end

  private

  def create_params
    params.permit(album: [:name, :artist, :description, :ranking])
  end
end
