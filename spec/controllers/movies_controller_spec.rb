require 'rails_helper'
require 'support/shared_controller_examples'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "medium"

  describe "GET #show" do
    it "renders the show template" do
      movie = create :movie

      get :show, id: movie.id

      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      movie = create :movie
      get :edit, id: movie.id

      expect(response).to have_http_status(200)
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    # positive test - movie params are valid
    context "Valid movie params" do
      let(:movie_params) do
        {
          movie: {
            name: 'new movie',
            director: 'johnny appleseed',
            description: 'this is the description'
          }
        }
      end

      it "creates a Movie record" do
        post :create, movie_params
        expect(Movie.count).to eq 1
      end

      it "redirects to the movie index page" do
        post :create, movie_params
        expect(subject).to redirect_to(movies_path)
      end
    end

    # negative test - movie params are invalid
    context "Invalid movie params" do
      let(:movie_params) do
        {
          movie: { # invalid because it's missing the :description key
            name: 'new movie',
            director: 'johnny appleseed'
          }
        }
      end

      it "does not persist invalid records" do
        post :create, movie_params
        expect(Movie.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, movie_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @movie = create :movie, director: "johnny appleseed"
    end

    it "updates a movie's attributes" do
      patch :update, id: @movie.id, movie: FactoryGirl.attributes_for(:movie, director: "dave johnson")
      @movie.reload
      expect(@movie.director).to eq('dave johnson')
    end

    it "redirects to the movie index page" do
      patch :update, id: @movie.id, movie: FactoryGirl.attributes_for(:movie, director: "dave johnson")
      @movie.reload
      expect(response).to redirect_to(movie_path(@movie))
    end
  end 

  describe "DELETE #destroy" do
    it "deletes a movie record" do
      movie = create :movie
      delete :destroy, id: movie.id
      expect(Movie.count).to eq 0
    end
  end
  
end # Rspec end



