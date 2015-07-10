class AlbumsController < ApplicationController
  def self.model
    Album
  end

  def index
    @albums = Album.all.order('ranking DESC')
  end

  def create
    @album = Album.create(create_params[:album])

    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
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

      if @album.save
        redirect_to album_path(@album)
      else
        render :edit
      end

    else
      new_ranking = @album.ranking + 1
      @album.update(ranking: new_ranking)
      redirect_to album_path(@album)
    end
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
