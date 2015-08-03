class BooksController < ApplicationController

  before_action :find_book, except: [:index, :new, :create]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    params = book_params[:book]
    @book = Book.new(params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @book.update(book_params[:book])

    redirect_to book_path(params[:id])
  end

  def destroy
    @book.destroy

    redirect_to '/books'    
  end

  def upvote
    @book.rank += 1
    @book.save

    redirect_to book_path(params[:id])
  end

##################### PRIVATE METHODS #####################
  private

  def book_params
    params.permit(book: [:id, :name, :author, :description, :rank])
  end

  def find_book
    @book = Book.find(params[:id])
  end
  
end
