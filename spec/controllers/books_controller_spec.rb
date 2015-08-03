require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller"
  let(:params) do
    {
      book: {
        title: "a title",
        author: "an author",
        description: "a description"
      }
    }
  end

  let(:minimal_params) do
    { book: { title: "a title" } }
  end

  let(:invalid_params) do
    { book: { description: "a description" } }
  end

  let(:medium_name) { :book }
end
