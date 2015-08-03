require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index" do
    it "responds successfully to an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "assigns instance variable @categories" do
      movie = Movie.create(name: 'movie', rank: 0)
      book = Book.create(name: 'book', rank: 0)
      album = Album.create(name: 'album', rank: 0)

      get :index

      expect(assigns(:categories)[:movies].first).to eq movie
      expect(assigns(:categories)[:books].first).to eq book
      expect(assigns(:categories)[:albums].first).to eq album
    end
  end
end
