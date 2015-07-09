require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  context "when newing up a Movie" do
    before(:each) do
      get :new
    end

    it "creates a new Movie" do
      expect(assigns(:movie)).to be_a_new(Movie)
    end
  end

  describe "GET #index" do
    it "assigns to @movies" do
      movie = Movie.create(name: "V for Vendetta", rank: 89)
      get :index
      expect(assigns(:movies)).to eq([movie])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
