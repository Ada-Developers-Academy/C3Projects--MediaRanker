class AlbumsController < ApplicationController

  before_action :select_media, only: [:show, :edit, :update, :yes_vote, :destroy]

  def select_media
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.best(5)
  end

  def create
    @album = Album.create(album_params)
     if @album.save
      redirect_to(albums_path)
     else
      render :new
     end
  end

  def new
    @album = Album.new

  end

  def show
    
  end

  def edit #GET one album to modify.
     
  end

  def update #PATCH this updated album to the db
    @album.update(album_params)
   
    
    redirect_to(album_path(@album.id)) 
  end

  def yes_vote # PATCH increase this number by one in the db
    @album.increment!(:vote)
    
    redirect_to(album_path(@album.id))
  end

  def destroy
    @album.destroy

    redirect_to(albums_path)
  end

  private

  def album_params
    params.require(:album).permit(:name, :director, :description, :vote)
  end


end
