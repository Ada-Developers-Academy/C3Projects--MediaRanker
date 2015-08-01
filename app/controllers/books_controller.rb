class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @books = Book.desc_order
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(create_params[:book])
    @book.ranking = 0

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @book.update(create_params[:book])

    if @book.save
       redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

  def upvote
    @book.ranking += 1
    @book.save

    redirect_to book_path(@book.id)
  end

#_________________________________________________________________________________
  private

  def create_params
    params.permit(book: [:name, :author, :description, :ranking])
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
