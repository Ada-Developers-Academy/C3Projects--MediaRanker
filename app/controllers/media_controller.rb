class MediaController < ApplicationController
    def index
      if request.path.include?("books")
        @media = Medium.find_books
      elsif request.path.include?("movies")
        @media = Medium.find_movies
      else
        @media = Medium.find_albums
      end
    end

  def new
    @media = Medium.new
    @method = :post
    
  end

  def create
    @media = Medium.create(media_params)
    redirect_to Medium.pick_index_path(@media)
  end


  def show
    @media = Medium.find(params[:id])
  end

  def edit
    @media = Medium.find(params[:id])
    @method = :patch
  end

  def update
    @media = Medium.find(params[:id])
    @media.update(media_params)
    redirect_to Medium.pick_path(@media)
  end

  def upvote
    @media = Medium.find(params[:id])
    @media.votes += 1
    @media.save
    @method = :patch
    redirect_to Medium.pick_index_path(@media)
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
  end

  def media_params
    params.require(:medium).permit(:name, :description, :creator, :format, :votes)
  end
end
