class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :upvote, :destroy]

  def index
    @books = Book.ranked
  end

  def new
    @medium = Book.new
    render 'shared/form'
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def edit
    @medium = @book
    render 'shared/form'
  end

  def update
    @book.update(book_params)
    if @book.save
      redirect_to @book
    else
      render :edit
    end
  end

  def upvote
    @book.add_vote

    redirect_to @book
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
    params.require(:book).permit(:title, :creator, :description, :rank)
  end

  def self.model
    Book
  end
end
