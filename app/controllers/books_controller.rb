class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(create_params[:book])

    redirect_to book_path(params[:id])
  end

##################### PRIVATE METHODS #####################
  private

  def create_params
    params.permit(book: [:id, :name, :author, :description, :rank])
  end
  
end
