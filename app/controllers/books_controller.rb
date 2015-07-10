class BooksController < ApplicationController
  def index
    @books = Book.all.rank_order
    @media_type = "book"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @action = "Edit"
  end

  def update
    @book = Book.find(params[:id])

    if params[:book].nil? == true
      @book.rank += 1
      @book.save
      render :show
    else
      @book.update(book_params)
      if @book.save
        render :show
      else
        @action = "Edit"
        render :edit
      end
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    redirect_to books_path
  end

  def new
    @book = Book.new
    @action = "New"
  end

  def create
    params[:book][:rank] = 0
    book = Book.create(book_params)

    if book.save
      redirect_to book_path(id: book.id)
    else
      @book = Book.new(book_params)
      @action = "New"
      render :new
    end
  end

  private

  def book_params
    params[:book].permit(:title, :author, :description, :rank)
  end
end
