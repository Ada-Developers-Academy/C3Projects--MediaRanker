require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe MoviesController do
    it_behaves_like "a media"
  end
end
