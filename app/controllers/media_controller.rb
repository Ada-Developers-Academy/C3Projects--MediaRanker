class MediaController < ApplicationController
  def index
    @movies = Medium.movies
    @books = Medium.books
    @albums = Medium.albums
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

  def create_params
  params.permit(medium: [:ranking, :name, :contributor, :description, :user, :media_type])
end
end
