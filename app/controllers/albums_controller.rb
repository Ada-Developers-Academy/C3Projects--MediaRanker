class AlbumsController < ApplicationController

  def index
   @albums = Album.all
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
    render :show

    # redirect_to album_path(@album.id) #album/:id
  end

  def destroy
    Album.destroy(params[:id])
    redirect_to '/albums'
  end
end
