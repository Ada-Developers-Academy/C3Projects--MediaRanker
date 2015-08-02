class MediaController < ApplicationController

  before_action :set_medium, only: [:show, :upvote, :edit, :update, :destroy]

  before_action :set_books, only: [:index, :all_books]
  before_action :set_movies, only: [:index, :all_movies]
  before_action :set_albums, only: [:index, :all_albums]

  def index
    #In case my bosses at MediaRanker want to change it to a top 20 list
    top_num = 10

    @movies.top_rank(top_num)

    @books.top_rank(top_num)

    @albums.top_rank(top_num)
  end

  def all_movies
    @movies.all_rank

    render :all_media
  end

  # This seems redundant. However, all these methods do something different.
  def all_books
    @books.all_rank

    render :all_media
  end

  def all_albums
    @albums.all_rank

    render :all_media
  end

  def show
    # The @type helps define which _media_details locals to load into the view
    @type = @medium.media_type.pluralize
  end

  def new
    @medium = Medium.new

    @type = params[:media_type]
  end

  def create
    @medium = Medium.new(create_params[:medium])

    if @medium.save
      redirect_to medium_path(@medium)
    else # guard clause
      redirect_to new_medium_path(@medium.media_type)
    end

  end

  def upvote
    @medium.ranking += 1

    @medium.save

    redirect_to medium_path
  end

  def update
    @medium.update(create_params[:medium])

    redirect_to medium_path
  end

  def destroy
    @media_type = @medium.media_type.pluralize

    @medium = Medium.destroy(params[:id])

    redirect_to "/#{@media_type}/index"
  end

  private

  def set_medium
    @medium = Medium.find(params[:id])
  end

  def set_movies
    @movies = Medium.movies
  end

  def set_albums
    @albums = Medium.albums
  end

  def set_books
    @books = Medium.books
  end

  def create_params
  params.permit(medium: [:ranking, :name, :contributor, :description, :user, :media_type])
  end
end
