require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  # shared examples
  describe BooksController do
    it_behaves_like "medium"
  end
end
