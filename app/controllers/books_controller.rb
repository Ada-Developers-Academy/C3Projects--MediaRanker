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

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(create_params[:book])
    redirect_to "/books/#{@book.id}"
  end

  def edit
    @single = find_book
  end

  def update
    @single = find_book
    @single.update(create_params[:book])
    @single.save

    redirect_to "/books/#{@book.id}"
  end

  def upvote
    @single = find_book
    @single.rank += 1
    @single.save

    redirect_to :book
  end

  def destroy
    @single = find_books
    @single.destroy

    redirect_to :books
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
