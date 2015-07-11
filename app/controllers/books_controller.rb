class BooksController < ApplicationController

  def index
    @books = Book.best(5)
  end

  def create
    @book = Book.new(permit_params[:book])
    @book.save

    redirect_to"/books"
  end

  def new
    @book= Book.new

    render :new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit #GET one book to modify.
   @book = Book.find(params[:id])   
  end

  def update #PATCH this updated book to the db
    @book = Book.find(params[:id]) 
    @book.name = permit_params[:book][:name]
    @book.author = permit_params[:book][:author]
    @book.description = permit_params[:book][:description]
    @book.save
    
    redirect_to(book_path(Book.find(@book.id))) 
  end

  def yes_vote # PATCH increase this number by one in the db
   @book = Book.find(params[:id])
   @book.increment!(:vote)
  
   redirect_to(book_path(Book.find(@book.id)))
  end

  def destroy
    @book = Book.find(params[:id]).destroy

    redirect_to(movies_path)
  end

  private

  def permit_params
    params.permit(book:[:name, :author, :description, :vote])
  end

end
