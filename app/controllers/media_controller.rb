class MediaController < ApplicationController
  def index
    @movies = Medium.movies.top_rank(10)
    @books = Medium.books.top_rank(10)
    @albums = Medium.albums.top_rank(10)
  end

  def all_movies
    @movies = Medium.movies.all_rank
    render :all_media
  end

  def all_books
    @books = Medium.books.all_rank
    render :all_media
  end

  def all_albums
    @albums = Medium.albums.all_rank
    render :all_media
  end

  def show
    @medium = Medium.find(params[:id])
    @type = @medium.media_type
  end

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.new(create_params[:medium])
    if @medium.save
      redirect_to media_path
    else
      render :new
    end
  end

  def upvote
    @medium = Medium.find(params[:id])
    @medium.ranking += 1
    @medium.save
    redirect_to medium_path
  end

  def edit
    @medium = Medium.find(params[:id])
  end

  def update
    @medium = Medium.find(params[:id])

    @medium.update(create_params[:medium])

    redirect_to medium_path
  end

  def destroy
    @medium = Medium.destroy(params[:id])

    redirect_to "/#{params[:from].pluralize}/index"


  end

  private

  def create_params
  params.permit(medium: [:ranking, :name, :contributor, :description, :user, :media_type])
  end
end
