class BooksController < ApplicationController
  def index
    @books = Medium.books
  end
end
