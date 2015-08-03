class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.rank_order
    @media_type = "movie"
  end

  def show; end

  def edit
    @action = "Edit"
  end

  def update
    if params[:movie].nil?
      @movie.rank += 1
      @movie.save
      render :show
    else
      if @movie.update(movie_params)
        render :show
      else
        @action = "Edit"
        render :edit
      end
    end
  end

  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  def new
    @movie = Movie.new
    @action = "New"
  end

  def create
    movie = Movie.create(movie_params)

    # this keeps you on the page to edit/create the form if you try
    # to make it without a title
    if movie.save
      redirect_to movie_path(id: movie.id)
    else
      @movie = Movie.new(movie_params)
      @action = "New"
      render :new
    end
  end

  private

  def movie_params
    params[:movie].permit(:title, :director, :description, :rank)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
