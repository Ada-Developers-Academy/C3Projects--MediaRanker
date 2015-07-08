class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @method = :post
  end

  def create
    @book = Book.create(book_params)
  end

  def update
  end

  def delete
  end

  def show
    @book = Book.find(params[:id])
    @edit_path = edit_book_path(@book.id)
    @index_path = books_path
  end

  def upvote
    book = Book.find(params[:id])
    book.votes += 1
  end

  def book_params
    params.require(:book).permit(:name, :description, :author, :votes)
  end
end


