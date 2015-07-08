class BooksController < ApplicationController
  def index
    @books = Medium.books.all_rank
  end
end
