class BooksController < ApplicationController

  before_action :find_book, except: [:index, :new, :create, :destroy]

  def index
    @books = Book.all

    @books = @books.order_desc
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params[:book])

    redirect_to books_path
  end

  def show

  end

  def edit

  end

  def update
    @book.update(book_params[:book])

    redirect_to book_path(@book.id)
  end

  def upvote
    @book.rank += 1

    @book.save

    redirect_to(:back) rescue redirect_to book_path
  end

  def destroy
    @book = Book.destroy(params[:id])

    redirect_to books_path
  end

  private

  def book_params
    params.permit(book: [:name, :author, :description, :rank])
  end

  def find_book
    @book = Book.find(params[:id])
  end

end
