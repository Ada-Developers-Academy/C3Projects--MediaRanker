require 'rails_helper'
require 'support/shared_controller_examples'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "MediaController"
  let(:model) { Book }
  let(:media) { "book".to_sym }
  let(:media_params) { { book: { name: "name" } } }
  let(:new_params) { { book: { name: "title" } } }
  let(:invalid_params) { { book: { desc: "desc" } } }
  let(:media_path) { "book_path" }
  let(:medias_path) { "books_path" }  
end
