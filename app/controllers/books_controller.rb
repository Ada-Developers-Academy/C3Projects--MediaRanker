class BooksController < ApplicationController

  def index
    @media = Book.all.order(rank: :desc)
    @medium = Book.new
  end

  def show
    @media = Book.find(params[:id])
  end

    def new
    @media = Book.new
    end

  def create
    @media = Book.new(create_params[:book])
    @media.save
    redirect_to book_path(@media)
  end

  def edit
    @media = Book.find(params[:id])
  end

  def update
    @media = Book.find(params[:id])
    @media.update(create_params[:book])
    redirect_to book_path(@media)
  end

  def destroy
    @media = Book.find(params[:id])
    @media.destroy
    redirect_to books_path
  end

  def upvote
    @media = Book.find(params[:id])
    @media.add_a_vote
    @media.save
    render :show
  end

  private

  def create_params
    params.permit(book: [:name, :creator, :description, :rank])
  end

end
