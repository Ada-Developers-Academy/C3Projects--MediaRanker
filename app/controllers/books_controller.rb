class BooksController < ApplicationController
  def index
    @books = Book.all.order('ranking DESC')
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    updated_book = create_params[:book]
    # opportunity for .valid? and error handling
    book.update(updated_book)

    redirect_to book_path(book)
  end

  private

  def create_params
    params.permit(book: [:title, :author, :description])
  end
end
