class BooksController < ApplicationController

  def index
    @all = Book.all
    @controller = "books"
  end

  def show
    @single = find_book
    @controller = "books"
    @creator = "Written by"
  end

  # PRIVATE METHODS ----------------------------------------------------------

private

  def find_book
    @book = Book.find(create_params[:id])
  end

  def create_params
    params.permit(:id, book: [:id, :name, :creator, :description, :rank])
  end


end
