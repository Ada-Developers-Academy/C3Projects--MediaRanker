class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @media = Movie.new
    @url = movies_path
    @method = :post
    @by = :director
  end

  def create
    @media = Movie.create(movie_params)
    @by = :director
    if @media.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
    @book = Movie.find(params[:id])
  end

  def edit
    @media = Movie.find(params[:id])
    @url = movie_path
    @method = :patch
    @by = :director
  end

  def update
    @media = Movie.find(params[:id])
    @media.update(movie_params)
    @media.save
    redirect_to movies_path
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movies_path
  end

  def vote
    @media = Movie.find(params[:id])
    @media.ranking += 1
    @media.save
    redirect_to movies_path
  end

private

  def self.model
    Movie
  end
  
  def movie_params
    params.require(:book).permit(:title, :author, :description, :ranking)
  end

end
