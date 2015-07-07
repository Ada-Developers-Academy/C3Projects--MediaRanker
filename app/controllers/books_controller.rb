class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index
   @books = Book.all
  end
  def destroy
    Book.destroy(params[:id])
    redirect_to '/books'
  end

end
