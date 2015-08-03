class BooksController < ApplicationController

  before_action :find_and_set_media, only: [:upvote, :show, :edit, :update, :destroy]
  before_action :set_creator, only: [:show, :new, :create, :edit, :update]


  def index
    # MOVE TO MODEL SCOPE
    @media = Book.all.order(rank: :desc)
    @new_media = Book.new
    @add_media = "a Book"
  end

  def upvote
    @media.increment!(:rank)
    redirect_to book_path(@media)
  end

  def show
    @created = "Written"
    @format = "Books"
  end

  def new
    @media = Book.new
  end

  def create
    @media = Book.create(book_params)
    if @media.save
      redirect_to book_path(@media)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @media.update(book_params)
      redirect_to book_path(@media)
    else
      render :edit
    end
  end

  def destroy
    @media.destroy
    redirect_to books_path
  end



  private

  def find_and_set_media
    @media = Book.find(params[:id])
  end

  def set_creator
    @creator = :author
  end

  def book_params
    params.require(:book).permit(:name, :author, :description)
  end

end
