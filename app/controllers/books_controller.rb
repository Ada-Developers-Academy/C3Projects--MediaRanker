class BooksController < ApplicationController
  def index
    @books = Book.all.order('ranking DESC')
  end

  def create
    @book = Book.create(create_params[:book])

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if params[:book]
      new_name        = params[:book][:name]
      new_author      = params[:book][:author]
      new_description = params[:book][:description]

      @book.update(        name: new_name,
                         author: new_author,
                    description: new_description
      )
    else
      new_ranking = @book.ranking + 1
      @book.update(ranking: new_ranking)
    end

    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private

  def create_params
    params.permit(book: [:name, :author, :description, :ranking])
  end
end
