class BooksController < ApplicationController

  def index
   @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end


  def destroy
    Book.destroy(params[:id])
    redirect_to '/books'
  end

end
