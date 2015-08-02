class MoviesController < ApplicationController
  def self.model
    Movie
  end

  def index
    @movies = Movie.ranking_order
  end

  def create
    @movie = Movie.create(create_params)

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if params[:movie]
      @movie.update(create_params)

      if @movie.save
        redirect_to movie_path(@movie)
      else
        render :edit
      end
    else
      @movie.ranking += 1
      @movie.save
      redirect_to movie_path(@movie)
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

private

  def create_params
    params.require(:movie).permit(:name, :director, :description, :ranking)
  end
end
