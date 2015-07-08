class MoviesController < ApplicationController
  def index
    @media = Movie.all.order(rank: :desc)
    @new_media = Movie.new
    @add_media = "a Movie"
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.increment!(:rank)
    redirect_to movie_path(@movie)
  end

  def show
    @media = Movie.find(params[:id])
    @created = "Directed"
    @creator = @media.director
    @format = "Movies"
    @class = Movie
  end

  def new
    @media = Movie.new
    @creator = :director
  end

  def create
    @media = Movie.create(movie_params)
    @creator = :director
    if @media.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @media = Movie.find(params[:id])
    @creator = :director
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update(movie_params)
      redirect_to movie_path(movie)
    else
      render :edit
    end
  end

  def destroy

  end



  private

  def movie_params
    params.require(:movie).permit(:name, :director, :description)
  end

end
