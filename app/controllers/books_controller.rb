class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def self.model
    Book
  end

  def find_book #Extracts out this search into one method
    @book = Book.find(params[:id])
  end

  def index
    books = Book.all
    count = books.count
    @books = Book.ranking(count)
  end

  def show

  end

  def upvote
    book = Book.find(params[:id])
    book.add_vote
    book.save

    redirect_to book_path
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(create_params[:book])
    @book.rank = 0

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @book.update(create_params[:book])

    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

  private

  def create_params
    params.permit(book: [:name, :creator, :description, :rank])
  end
end
