class BooksController < ApplicationController

  def index
    @all = Book.all
  end

end
