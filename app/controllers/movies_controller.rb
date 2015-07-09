class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @media = Movie.new
    @url = books_path
    @method = :post
    @by = :artist
  end

  def create
    @media = Movie.create(album_params)
    @by = :director
    if @media.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    @book = Movie.find(params[:id])
  end

  def edit
    @media = Movie.find(params[:id])
    @url = book_path
    @method = :patch
    @by = :artist
  end

  def update
    @media = Movie.find(params[:id])
    @media.update(book_params)
    @media.save
    redirect_to books_path
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :description, :ranking)
  end

end
