class BooksController < ApplicationController
  before_action :set_book, only: [:update]

  def index
    @books = Book.all
  end

  def update
    if params[:upvote] == "true"
      Book.upvote(@book)
      redirect_to book_path(@book)
    end
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
end
