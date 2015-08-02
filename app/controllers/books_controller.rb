class BooksController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :upvote, :destroy]

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
      render :new
    end
  end

  def edit
    render 'shared/form'
  end

  def update
    @medium.update(book_params)
    if @medium.save
      redirect_to @medium
    else
      render :edit
    end
  end

  def upvote
    @medium.add_vote

    redirect_to @medium
  end

  def destroy
    @medium.destroy

    redirect_to books_path
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
