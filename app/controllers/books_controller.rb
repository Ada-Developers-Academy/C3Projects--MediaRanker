class BooksController < ApplicationController

  before_action :select_media, only: [:show, :edit, :update, :yes_vote, :destroy]

  def select_media
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.best(5)
  end

  def create
    @book = Book.create(book_params)

    redirect_to(books_path)
  end

  def new
    @book= Book.new

  end

  def show
  end

  def edit #GET one book to modify.   
  end

  def update #PATCH this updated book to the db 
    @book.update(book_params) 
    
    redirect_to(book_path(@book.id)) 
  end

  def yes_vote # PATCH increase this number by one in the db
   @book.increment!(:vote)
  
   redirect_to(book_path(@book.id))
  end

  def destroy
    @book.destroy

    redirect_to(books_path)
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :description, :vote)
  end

end
