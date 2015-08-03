class MoviesController < ApplicationController
  def index
    @movies = Movie.all.rank_order
    @media_type = "movie"
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    @action = "Edit"
  end

  def update
    @movie = Movie.find(params[:id])

    if params[:movie].nil? == true
      @movie.rank += 1
      @movie.save
      render :show
    else
      @movie.update(movie_params)
      if @movie.save
        render :show
      else
        @action = "Edit"
        render :edit
      end
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy

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
end
