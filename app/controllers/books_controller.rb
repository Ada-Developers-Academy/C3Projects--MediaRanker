class BooksController < ApplicationController
  before_action :find_all_media, only: [:index]
  before_action :create_medium, only: [:index, :new, :create]
  before_action :find_media, only: [:show, :edit, :update, :destroy, :upvote]

  def create
    @medium = Book.new(create_params[:book])
    @medium.save
    redirect_to books_path
  end

  def update
    @media.update(create_params[:book])
    redirect_to book_path(@media)
  end

  private

    def create_params
      params.permit(book: [:name, :creator, :description, :rank])
    end

    def find_all_media
      @all_media = Book.all.rank_order
    end

    def find_media
      # find a specific instance based on params
      @media = Book.find(params[:id])
    end

    def create_medium
      # medium is the new instance
      @medium = Book.new
    end
end
