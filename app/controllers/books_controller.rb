class BooksController < ApplicationController

  def self.model
    Book
  end

  def index
    books = Book.all
    count = books.count
    @books = Book.ranking(count)
  end

  def show
    @book = Book.find(params[:id])
  end

  def upvote
    book = Book.find(params[:id])
    book.add_vote
    book.save

    redirect_to book_path
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(create_params[:book])
    @book.rank = 0

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    show
  end

  def update
    edit
    @book.update(create_params[:book])

    redirect_to book_path(@book)
  end

  def destroy
    edit
    @book.destroy

    redirect_to books_path
  end

  private

  def create_params
    params.permit(book: [:name, :creator, :description, :rank])
  end

end
