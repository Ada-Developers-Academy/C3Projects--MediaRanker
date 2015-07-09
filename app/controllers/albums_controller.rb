class AlbumsController < ApplicationController

  def index
    @Albums = Album.all
  end

  def create
    @album = Album.new(permit_params[:album])
    @album.save

    redirect_to"/albums"
  end

  def new
    @album = Album.new

    render :new
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit #GET one album to modify.
   @album = Album.find(params[:id])   
  end

  def update #PATCH this updated album to the db
    @album = Album.find(params[:id]) 
    @album.name = permit_params[:album][:name]
    @album.director = permit_params[:album][:director]
    @album.description = permit_params[:album][:description]
    @album.save
    
    redirect_to(album_path(Album.find(@album.id))) 
  end

  def yes_vote # PATCH increase this number by one in the db
   @album = Album.find(params[:id])
   # @album.vote += 1
   # @album.save
    @album.increment!(:vote)
  redirect_to(album_path(Album.find(@album.id)))
  end

  def destroy
    @album = Album.find(params[:id]).destroy

    redirect_to(albums_path)
  end

  private

  def permit_params
    params.permit(album:[:name, :director, :description, :vote])
  end


end
