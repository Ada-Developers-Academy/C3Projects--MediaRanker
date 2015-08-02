class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :upvote, :destroy]

  def index
    @model = Book
  end

  def show
  end

  def new
    @single = Book.new
  end

  def create
    @single = Book.create(book_params)

    if @single.save
      redirect_to book_path(@single.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @single.update(book_params)
    @single.save

    redirect_to book_path(@single.id)
  end

  def upvote
    @single.rank += 1
    @single.save

    redirect_to :book
  end

  def destroy
    @single.destroy
    redirect_to :books
  end

  # PRIVATE METHODS ----------------------------------------------------------
private
  def self.model
    Book
  end

  def find_book
    @single = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:id, :name, :creator, :description, :rank)
  end

end
