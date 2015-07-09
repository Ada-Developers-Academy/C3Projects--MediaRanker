require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET index" do

    it "renders the index template" do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end

  #   it "assigns @movies to all of the movies in the database" do
  #     movie1 = Movie.new
  #     movie2 = Movie.new
  #     movie3 = Movie.new

  #     @movies = Movie.all

  #     get :index
  #     expect(@movies.length).to eq(3)
  #   end
  end

end
