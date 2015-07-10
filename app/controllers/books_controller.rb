class BooksController < ApplicationController

  before_action :get_book, only: [:show, :edit, :update, :upvote, :destroy]

  def get_book
    @book = Book.find(params[:id])
  end

  def self.model
    Book
  end

  # Show book(s)
  def index
    @books = Book.order(:name)
  end

  def show
  end

  # Add a book
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  # Edit a book
  def edit
  end

  def update
    @book.update(book_params)

    redirect_to book_path
  end

  # Upvote a book
  def upvote
    @book.vote += 1
    @book.save

    redirect_to book_path
  end

  # Delete a book
  def destroy
    @book.destroy

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :desc)
  end
end
