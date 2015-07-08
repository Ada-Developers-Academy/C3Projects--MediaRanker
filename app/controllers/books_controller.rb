class BooksController < ApplicationController

  def index
   @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(create_params[:book])
    @book.rank = 0

    if @book.save
      render :show
    else
      render :new
    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    name_input = params[:book][:name]
    author_input = params[:book][:author]
    description_input = params[:book][:description]

    @book.update(name: name_input, author: author_input , description: description_input)
    if @book.save
      redirect_to books_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to '/books'
  end

private

  def edit_params
    params.permit(book: [:name, :author, :description])
  end

  def create_params
    params.permit(book: [:name, :author, :description])
  end

end
