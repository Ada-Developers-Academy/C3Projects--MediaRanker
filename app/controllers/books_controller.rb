class BooksController < ApplicationController

  def index
    @all = Book.all
    @controller = "books"
  end

private

  def create_params
    params.permit(single: [:id, :name, :author, :description, :rank])
  end

end
