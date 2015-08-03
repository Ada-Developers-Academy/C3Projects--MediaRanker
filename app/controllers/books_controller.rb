class BooksController < ApplicationController
  before_action :find_book, except: [:index, :new, :create]

  def index
   @books = Book.ordered
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params[:book])

    if @book.save
      render :show
    else
      render :new
    end

  end

  def edit; end

  def show; end

  def update
    @book.update(book_params[:book])
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def upvote
    Book.upvote(@book)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book.destroy
    redirect_to '/books'
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(book: [:name, :author, :description])
  end

end
