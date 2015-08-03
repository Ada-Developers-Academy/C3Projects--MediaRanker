class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.rank_order
  end

  def show; end

  def edit
    @action = "Edit"
  end

  def update
    if params[:book].nil?
      @book.rank += 1
      @book.save
      render :show
    else
      if @book.update(book_params)
        render :show
      else
        @action = "Edit"
        render :edit
      end
    end
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

  def new
    @book = Book.new
    @action = "New"
  end

  def create
    book = Book.create(book_params)

    if book.save
      redirect_to book_path(id: book.id)
    else
      @book = Book.new(book_params)
      @action = "New"
      render :new
    end
  end

  private

  def book_params
    params[:book].permit(:title, :author, :description, :rank)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
