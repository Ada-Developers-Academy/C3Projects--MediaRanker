class BooksController < ApplicationController

  def index
   @books = Book.all
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
    render :show

    # redirect_to book_path(@book.id) #book/:id
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to '/books'
  end

end
