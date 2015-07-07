class BooksController < ApplicationController

  def index
    @media = Book.all.order(rank: :desc)
  end

  def show
    @book = Book.find(params[:id])
  end

    def new
    @book = Book.new
    end

  def create
    @book = Book.new(create_params[:book])
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(create_params[:book])
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def add_a_vote
    @book = Book.find(params[:id])
    @book.rank += 1
  end

  def upvote
    @book = Book.find(params[:id])
    @book.add_a_vote
    @book.update(create_params[:rank])
    render :show
  end


  private

  def create_params
    params.permit(book: [:name, :author, :description, :rank])
  end

end
