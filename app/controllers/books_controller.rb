class BooksController < ApplicationController
  def index
    @books = Medium.books
  end

  def show
    @book = Medium.find(params[:id])
  end
end
