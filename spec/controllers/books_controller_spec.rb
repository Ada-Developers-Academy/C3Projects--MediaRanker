require 'rails_helper'
require 'support/shared_controller_examples'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "MediaController"
  let(:model) { Book } 
end
