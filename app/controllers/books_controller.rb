class BooksController < ApplicationController

  before_action :get_book, only: [:show, :edit, :update, :destroy]

  def get_book
    @book = Book.find(params[:id])
  end

  def show
  end

  def update
    @book.update(book_params)
    @book.vote += 1
    @book.save

    redirect_to book_path
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :desc)
  end
end
