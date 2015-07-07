class BooksController < ApplicationController

  def index
    @books = Book.ranking
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.rank += 1
    book.save

    redirect_to book_path
  end

end
