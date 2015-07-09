require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  context "when newing up a Book" do
    before(:each) do
      get :new
    end

    it "creates a new book" do
      expect(assigns(:book)).to be_a_new(Book)
    end
  end
end
