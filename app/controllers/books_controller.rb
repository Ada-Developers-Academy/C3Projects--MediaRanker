class BooksController < ApplicationController


  def index
    @controller = "books"
    @model = Book
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
    @book = Book.create(book_params)
    redirect_to "/books/#{@book.id}"
  end

  def edit
    @single = find_book
  end

  def update
    @single = find_book
    @single.update(book_params)
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
    @single = find_book
    @single.destroy

    redirect_to :books
  end

  # PRIVATE METHODS ----------------------------------------------------------
private
  def self.model
    Book
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:id, :name, :creator, :description, :rank)
  end


end
