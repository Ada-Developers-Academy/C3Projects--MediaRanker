class BooksController < ApplicationController

  def index
    @books = Book.all

    @books = @books.order('rank DESC')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(create_params[:book])

    redirect_to books_path
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

    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.destroy(params[:id])

    redirect_to books_path
  end

  private

  def create_params
    params.permit(book: [:name, :author, :description, :rank])
  end

end
