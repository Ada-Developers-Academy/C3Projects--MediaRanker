require 'rails_helper'

RSpec.describe BooksController, type: :controller do
     it "routes GET /books to books#index" do
      expect(get: '/books').to route_to('books#index')
    end
end
