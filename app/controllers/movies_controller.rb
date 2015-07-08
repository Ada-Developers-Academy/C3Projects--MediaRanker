class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  
  end

  def new
    @movie = Movie.new
    @method = :post
    
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to movies_path
  end


  def show
    @movie = Movie.find(params[:id])
    @edit_path = edit_movie_path(@movie.id)
    @index_path = movies_path
  end

  def edit
    @movie = Movie.find(params[:id])
    @method = :patch
    if @movie.director.nil?
      @creator = " "
    else
      @creator = @movie.director
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    render :show
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.votes += 1
    @movie.save
    @method = :patch
    redirect_to movie_path(@movie.id)
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
  end

  def movie_params
    params.require(:movie).permit(:name, :description, :director, :votes)
  end
end
