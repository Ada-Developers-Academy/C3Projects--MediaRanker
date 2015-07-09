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

end
