class Category < ActiveRecord::Base
  def index
    @categories = Category.all.map { |cat| cat.name }
  end
end
