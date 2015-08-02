class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :show, :update, :destroy]

  def self.model
    Book
  end

  def index
    @books = Book.ranking_order
  end

  def create
    @book = Book.create(create_params)

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def new
    @book = Book.new
  end

  def edit; end

  def show; end

  def update
    if params[:book]
      @book.update(create_params)

      if @book.save
        redirect_to book_path(@book)
      else
        render :edit
      end

    else
      @book.ranking += 1
      @book.save
      redirect_to book_path(@book)
    end
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

private

  def create_params
    params.require(:book).permit(:name, :author, :description, :ranking)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
