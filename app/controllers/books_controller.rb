class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    params = create_params[:book]
    params[:rank] = 0
    @book = Book.new(params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(create_params[:book])

    redirect_to book_path(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to '/books'    
  end

  def upvote
    @book = Book.find(params[:id])
    @book.rank += 1
    @book.save

    redirect_to book_path(params[:id])
  end

##################### PRIVATE METHODS #####################
  private

  def create_params
    params.permit(book: [:id, :name, :author, :description, :rank])
  end
  
end
