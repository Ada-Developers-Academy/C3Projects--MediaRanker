require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like 'a MediaController', Book, :book
end
