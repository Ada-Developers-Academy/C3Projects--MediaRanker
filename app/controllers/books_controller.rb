class BooksController < ApplicationController
  before_action :set_book, only: [:update, :show]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(create_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def update
    if params[:upvote] == "true"
      Book.upvote(@book)
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def show
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def create_params
    params.require(:book).permit(:title, :written_by, :description)
  end
end
