class CategoriesController < ApplicationController
  def index
    # # doesn't work
    # @categories = Category.all.map { |cat| cat.name }

    @categories = [Movie, Book, Album]
  end
end
