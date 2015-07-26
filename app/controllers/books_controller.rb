class BooksController < ApplicationController
  before_action :find_book, only: [:upvote, :show, :edit, :update, :destroy]

  def self.model
    Book
  end

  def index
    @books = Book.all.order('ranking DESC')
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def upvote
    @book.ranking += 1
    @book.save

    render :show, medium: @book
  end

  def create
    @book = Book.new(create_params[:book])

    if @book.save
      redirect_to book_path(@book)
    else
      @book
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    updated_book = create_params[:book]
    @book.update(updated_book)

    redirect_to book_path(@book)
  end

  def destroy
    @book.destroy
    redirect_to media_path
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def create_params
    params.permit(book: [:title, :author, :description])
  end
end
