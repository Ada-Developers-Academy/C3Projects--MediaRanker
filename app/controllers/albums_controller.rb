class AlbumsController < ApplicationController

    def index
      @albums = Album.all
    end

    def show
      find_album
    end

    def new
      @album = Album.new
      render :new
    end

    def create
      @albums = Album.all
      @new = Album.new(album_params[:album])
      @new.save

      render :index
    end

    def find_album
      @album = Album.find(params[:id])
    end

    def edit
      find_album
      render :edit
    end

    def update
      find_album
      params = album_params[:album]
      @album.update(params)
      @album.save
      redirect_to album_path
    end


    def destroy
      find_album
      @album.destroy
      redirect_to albums_path
    end

    def upvote
      find_album
      @album.increment!(:vote)
      redirect_to albums_path
    end

    def downvote
      find_album
      @album.decrement!(:vote)
      redirect_to albums_path
    end

  private
    def album_params
      params.permit(album: [:title, :artist, :description, :vote])
    end

end
