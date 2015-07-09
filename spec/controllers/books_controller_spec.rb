require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET new" do
    before(:each) do
      get :new
    end

    it "creates a new book" do
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "GET index" do
    it "assigns @books" do
      book = Book.create(name: "Girl with the Dragon Tattoo", rank: 89)
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
