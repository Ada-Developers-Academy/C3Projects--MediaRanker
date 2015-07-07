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
    @book = Book.new(create_params[:book])
    @book.save

    render :show
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      new_name = params[:book][:name]
      new_author = params[:book][:author]
      new_description = params[:book][:description]

    @book.update(name: new_name,
                 author: new_author,
                 description: new_description)
    @books = Book.all

    render :show
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to action: :index
  end


  private

  def create_params
    params.permit(book: [:name, :author, :description])
  end
end
