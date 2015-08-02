require 'rails_helper'

RSpec.describe BooksController, type: :controller do
    let (:model) { Book }

    it_behaves_like "a media"
  end



