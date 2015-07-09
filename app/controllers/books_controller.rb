class BooksController < ApplicationController
  def index
    @books = Book.all.rank_order
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    show
  end

  def update
    show
    @book.update(create_params[:book])

    redirect_to book_path(@book.id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(create_params[:book])
    @book.rank = 0
    @book.save

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def destroy
    show
    @book.destroy

    redirect_to books_path
  end

  def upvote
    show
    @book.rank += 1
    @book.save

    redirect_to book_path(@book.id)
  end

  private

  def create_params
    params.permit(book: [:title, :author, :rank, :description])
  end

end
