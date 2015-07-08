class BooksController < ApplicationController
  def index
    @books = Book.all.order(rank: :desc)
  end

  def upvote
    @book = Book.find(params[:id])
    @book.increment!(:rank)
    redirect_to book_path(@book)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @media = Book.new
    @creator = :author
  end

  def create
    @media = Book.create(book_params)
    @creator = :author
    if @media.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @media = Book.find(params[:id])
    @creator = :author
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book)
    else
      render :edit
    end
  end

  def destroy

  end



  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end

end
