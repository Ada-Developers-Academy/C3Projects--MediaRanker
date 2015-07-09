class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @media = Book.new
    @url = books_path
    @method = :post
    @by = :artist
  end

  def create
    @media = Book.create(album_params)
    @by = :artist
    if @media.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @media = Book.find(params[:id])
    @url = book_path
    @method = :patch
    @by = :author
  end

  def update
    @media = Book.find(params[:id])
    @media.update(book_params)
    @media.save
    redirect_to books_path
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :description, :ranking)
  end

end
