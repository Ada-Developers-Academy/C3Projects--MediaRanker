class MediaController < ApplicationController
  before_action :find_media

  MEDIA_LIMIT = 4

  def find_media
    @movies = Medium.sort_votes(Medium.find_movies)
    @books = Medium.sort_votes(Medium.find_books)
    @albums = Medium.sort_votes(Medium.find_albums)
  end

  def home
    @movies_limit = @movies.first(MEDIA_LIMIT)
    @books_limit = @books.first(MEDIA_LIMIT)
    @albums_limit = @albums.first(MEDIA_LIMIT)
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
    @errors = nil
    if @media.valid?
      redirect_to Medium.pick_index_path(@media.format)
    else
      @errors = @media.errors.messages
      render :new
    end
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
    if @media.update(media_params)
      redirect_to Medium.pick_path(@media)
    else
      @errors = @media.errors.messages
      @method = :patch
      render :edit
    end
  end

  def upvote
    @media = Medium.find(params[:id])
    @media.votes += 1
    @media.save
    @method = :patch
    redirect_to Medium.pick_path(@media)
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
