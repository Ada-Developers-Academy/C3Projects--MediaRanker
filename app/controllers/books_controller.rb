class BooksController < ApplicationController
  before_action :find, except: [:new, :create, :index]
  before_action :author, only: [:create, :create, :edit]

  def find
    @media = Book.find(params[:id])
  end

  def author
    @by = :author
  end

  def index
    @books = Book.all
  end

  def new
    @media = Book.new
    @url = books_path
    @method = :post
  end

  def create
    @media = Book.create(book_params)
    if @media.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show;  end

  def edit
    @url = book_path
    @method = :patch
  end

  def update
    @media.update(book_params)
    @media.save
    redirect_to books_path
  end

  def destroy
    @media.destroy
    redirect_to books_path
  end

  def vote
    @media.ranking += 1
    @media.save
    redirect_to books_path
  end

private

  def self.model
    Book
  end
  
  def book_params
    params.require(:book).permit(:title, :author, :description, :ranking)
  end

end
