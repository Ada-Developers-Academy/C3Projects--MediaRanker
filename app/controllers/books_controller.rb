class BooksController < ApplicationController
  before_action :find_book, only: [ :show, :edit, :update, :destroy, :upvote ]

  def self.model
    Book
  end

  def index
    @books = Book.all.rank_order
  end

  def show; end

  def edit; end

  def update
    @book.update(create_params[:book])

    redirect_to book_path(@book.id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(create_params[:book])

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

  def upvote
    @book = Book.upvote_medium(@book)

    redirect_to book_path(@book.id)
  end

  private

  def create_params
    params.permit(book: [:title, :author, :rank, :description])
  end

  def find_book
    @book = Book.find(params[:id])
  end

end
