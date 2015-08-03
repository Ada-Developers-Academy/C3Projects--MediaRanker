require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe BooksController do
    it_behaves_like "a media controller"
  end
end
