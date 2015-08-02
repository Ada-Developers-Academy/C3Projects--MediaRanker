require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET index" do

    it "renders the index template" do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end

    it "assigns @movies to top 5 ranked movies in the database" do
      movie1 = Movie.create(name: 'a movie', description: 'a description', rank: 5000)
      movie2 = Movie.create(name: 'b movie', description: 'b description', rank: 40)
      movie3 = Movie.create(name: 'c movie', description: 'c description', rank: 2)
      movie4 = Movie.create(name: 'd movie', description: 'd description', rank: 230)
      movie5 = Movie.create(name: 'e movie', description: 'e description', rank: 5500)
      movie6 = Movie.create(name: 'f movie', description: 'f description', rank: 200)
      movie7 = Movie.create(name: 'g movie', description: 'g description', rank: 15)

      get :index
      expect(assigns(:movies).length).to eq(5)
    end
  end

end
