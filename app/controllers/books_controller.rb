class BooksController < ApplicationController
  def index
    @media = Book.all.order(rank: :desc)
    @new_media = Book.new
    @add_media = "a Book"
  end

  def upvote
    @book = Book.find(params[:id])
    @book.increment!(:rank)
    redirect_to book_path(@book)
  end

  def show
    @media = Book.find(params[:id])
    @created = "Written"
    @creator = @media.author
    @format = "Books"
    @class = Book
  end

  def new
    @media = Book.new
    @creator = :author
  end

  def create
    @media = Book.create(book_params)
    @creator = :author
    if @media.save
      redirect_to book_path(@media)
    else
      render :new
    end
  end

  def edit
    @media = Book.find(params[:id])
    @creator = :author
  end

  def update
    @media = Book.find(params[:id])
    @creator = :author
    if @media.update(book_params)
      redirect_to book_path(@media)
    else
      render :edit
    end
  end

  def destroy
    @media = Book.find(params[:id])
    @media.destroy
    redirect_to polymorphic_path(Book)
  end



  private

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end

end
