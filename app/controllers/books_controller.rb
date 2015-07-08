class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @medium = Book.new
  end

  def create
    book = Book.create(book_params)

    redirect_to book
  end

  def edit
    @medium = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)

    redirect_to book
  end

  def upvote
    book = Book.find(params[:id])
    book.add_vote

    redirect_to book
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :rank)
  end
end
