class BooksController < ApplicationController
  def index
    @books = Book.all.rank_order
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if params[:book].nil? == true
      @book.rank += 1
      @book.save
    else
      @book.update(book_params)
    end

    render :show
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    redirect_to root_path
  end

  private

  def book_params
    params[:book].permit(:title, :author, :description, :rank)
  end
end
