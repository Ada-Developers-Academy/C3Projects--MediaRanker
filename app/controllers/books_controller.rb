class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def upvote
    @book = Book.find(params[:id])
    @book.increment!(:rank)
    redirect_to book_path(@book)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
    redirect_to books_path
  end

  def edit

  end

  def update

  end

  def destroy

  end



  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end

end
