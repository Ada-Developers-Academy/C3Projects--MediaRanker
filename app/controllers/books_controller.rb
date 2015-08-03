class BooksController < ApplicationController
  before_action :set_medium, except: [:index, :new, :create]

  def index
    @media = Book.ranked
    render 'shared/index'
  end

  def new
    @medium = Book.new
    render 'shared/form'
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to @book
    else
      render 'shared/form'
    end
  end

  private

  def set_medium
    @medium = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :creator, :description, :rank)
  end

  def self.model
    Book
  end
end
