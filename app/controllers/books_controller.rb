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
    @book = Book.create(permit_params)

    super
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id]).update(permit_params)

    super
  end

  def destroy
    @book = Book.find(params[:id]).destroy

    super
  end

  def upvote
    @book = Book.find(params[:id])
    votes = @book.rank
    votes += 1
    @book.update(rank: votes)

    super
  end

  private

  def permit_params
    params.require(:book).permit(:name, :author, :description)
  end

end
