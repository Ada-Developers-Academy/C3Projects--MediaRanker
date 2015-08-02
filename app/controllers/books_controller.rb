class BooksController < ApplicationController
  before_action :set_book, only: [:update, :show, :destroy, :edit]

  def self.model
    Book
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:upvote] == "true"
      Book.upvote(@book)
      redirect_to book_path(@book)
    else
      if @book.update(book_params)
        redirect_to book_path(@book)
      else
        render :edit
      end
    end
  end

  def show
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :written_by, :description)
  end
end
