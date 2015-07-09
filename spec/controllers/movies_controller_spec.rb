require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    # positive test - movie params are valid
    context "valid movie params" do
      let(:movie_params) do
        {
          movie: {
            title: 'some movie', 
            rank: 5
          }
        }
      end

      it "creates an Movie record" do
        post :create, movie_params
        expect(Movie.count).to eq 1
      end

      it "redirect to the movie show page" do
        post :create, movie_params
        expect(subject).to redirect_to(movie_path(assigns(:movie)))
      end
    end

    # negative test - movie params are invalid
    context "invalid movie params" do
      let(:movie_params) do
        {
          movie: { # missing the title key
            rank: 5
          }
        }
      end

      it "does not persist invalid records" do
        post :create, movie_params
        expect(Movie.count).to eq 0
      end

      it "renders the new template" do
        post :create, movie_params
        expect(response).to render_template("new")
      end
    end
  end
end
