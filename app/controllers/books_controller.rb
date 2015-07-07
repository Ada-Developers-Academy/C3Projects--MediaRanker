class BooksController < ApplicationController

  def index
    @books = Book.ranking
  end

  def show
    @book = Book.find(params[:id])
  end

  def upvote
    book = Book.find(params[:id])
    book.rank += 1
    book.save

    redirect_to book_path
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(create_params[:book])
    @book.rank = 0
    @book.save

    redirect_to book_path(@book)
  end

  def edit
    show
  end

  def update
    edit
    @book.update(create_params[:book])

    redirect_to book_path(@book)
  end

  private

  def create_params
    params.permit(book: [:name, :author, :description, :rank])
  end

end
