class AlbumsController < ApplicationController


    def index
      @albums = Album.all
    end

    def show
      @album = Album.find(params[:id])
    end

    def new
      @album = Album.new
      render :new
    end

    def create
      @albums = Album.all
      @new = Album.new(create_params[:album])
      @new.save

      render :index
    end

    def edit
      @album = Album.find(params[:id])
      render :edit
    end

    def update
      @album = Album.find(params[:id])
      album_params = create_params[:album]
      @album.update(album_params)
      @album.save
      redirect_to "/albums/#{@album.id}"
    end


    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to "/albums"
    end

    def upvote
      @album = Album.find(params[:id])
      @album.increment!(:vote)
      redirect_to "/albums"
    end

    def downvote
      @album = Album.find(params[:id])
      @album.decrement!(:vote)
      redirect_to "/albums"
    end

  private
    def create_params
      params.permit(album: [:title, :artist, :description, :vote])
    end

end
