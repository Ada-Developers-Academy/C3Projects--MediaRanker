class BooksController < ApplicationController

  def index
    @books = Book.best_first_all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.rank = 0
    if @book.save
      super
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      super
    else
      render :edit
    end
  end

  def destroy
    Book.find(params[:id]).destroy

    super
  end

  def upvote
    @book = Book.find(params[:id])
    @book.increment!(:rank)

    super
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end

end
