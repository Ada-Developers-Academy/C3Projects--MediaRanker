class BooksController < ApplicationController
  before_action :set_book, only: [:show, :upvote, :destroy]
  before_action :set_medium, only: [:edit, :update]

  def index
    @books = Book.all_ranked
  end

  def new
    @medium = Book.new
  end

  def create
    @medium = Book.create(book_params)
    if @medium.save
      redirect_to @medium
    else
      render :new
    end
  end

  def update
    @medium.update(book_params)
    if @medium.save
      redirect_to @medium
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

  def set_medium
    @medium = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :creator, :description, :rank)
  end
end
