class MediaController < ApplicationController
  before_action :find_media

  def find_media
    @movies = Medium.sort(Medium.find_movies)
    @books = Medium.sort(Medium.find_books)
    @albums = Medium.sort(Medium.find_albums)
  end

  def home
    @movies
    @books
    @albums
  end

  def index
    if request.path.include?("books")
      @media = @books
    elsif request.path.include?("movies")
      @media = @movies
    else
      @media = @albums
    end
  end

  def new
    @media = Medium.new
    @method = :post
    
  end

  def create
    @media = Medium.create(media_params)
    redirect_to Medium.pick_index_path(@media.format)
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
    redirect_to Medium.pick_index_path(@media.format)
  end

  def destroy
    media = Medium.find(params[:id])
    format = media.format
    media.destroy
    redirect_to Medium.pick_index_path(format)
  end

  def media_params
    params.require(:medium).permit(:name, :description, :creator, :format, :votes)
  end
end
