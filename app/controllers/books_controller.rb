class BooksController < ApplicationController
  before_action :find_book, except: [:index, :new, :create]

  def index
   @books = Book.ordered
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params[:book])

    if @book.save
      render :show
    else
      render :new
    end

  end

  def edit; end

  def show; end

  def update
    name_input = params[:book][:name]
    author_input = params[:book][:author]
    description_input = params[:book][:description]

    @book.update(name: name_input, author: author_input , description: description_input)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def upvote
    @book.rank += 1
    @book.save
    redirect_to book_path(@book.id)
  end

  def destroy
    @book.destroy
    redirect_to '/books'
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(book: [:name, :author, :description])
  end

end
