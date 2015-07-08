class BooksController < ApplicationController
  def index

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
end
