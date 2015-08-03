class BooksController < ApplicationController

  def create
    @medium.create(create_params[:book])
  end

  def update
    @media.update(create_params[:book])
  end

  private

    def create_params
      params.permit(book: [:name, :creator, :description, :rank])
    end
end
