class BooksController < ApplicationController

  def index
    @media = Book.all
  end

end
