require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET index" do

    it "renders the index template" do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end

    it "assigns @movies to all of the movies in the database" do
      movie1 = Movie.create(name: 'a movie', description: 'a description')
      movie2 = Movie.create(name: 'b movie', description: 'b description')
      movie3 = Movie.create(name: 'c movie', description: 'c description')

      @movies = Movie.all

      get :index
      expect(@movies.length).to eq(3)
    end
  end

end
