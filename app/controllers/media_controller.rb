class MediaController < ApplicationController
  def index
    #In case my bosses at MediaRanker want to change it to a top 20 list
    top_num = 10

    @movies = Medium.movies.top_rank(top_num)

    @books = Medium.books.top_rank(top_num)

    @albums = Medium.albums.top_rank(top_num)
  end

  def all_movies
    @movies = Medium.movies.all_rank

    render :all_media
  end

  # This seems redundant. However, all these methods do something different.
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
    @media_type = Medium.find(params[:id]).media_type.pluralize
    @medium = Medium.destroy(params[:id])

    redirect_to "/#{@media_type}/index"
  end

  private

  def create_params
  params.permit(medium: [:ranking, :name, :contributor, :description, :user, :media_type])
  end
end
