class AlbumsController < ApplicationController
  before_action :find_book, except: [:index, :new, :create]

  def index
   @albums = Album.ordered
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params[:album])

    if @album.save
      render :show
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    name_input = params[:album][:name]
    artist_input = params[:album][:artist]
    description_input = params[:album][:description]

    @album.update(name: name_input, artist: artist_input, description: description_input)
    if @album.save
      redirect_to album_path(@album.id)
    else
      render :edit
    end
  end

  def upvote
    @album.rank += 1
    @album.save
    redirect_to album_path(@album.id)
  end

  def destroy
    @album.destroy
    redirect_to '/albums'
  end

  private

  def find_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.permit(album: [:name, :artist, :description])
  end

end
