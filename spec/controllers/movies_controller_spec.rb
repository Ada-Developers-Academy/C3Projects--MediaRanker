require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
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
  end # POST create test end

  describe "PATCH #update" do
    let(:movie_params) do
      {
        movie: { # invalid because it's missing the :description key
          name: 'new movie',
          director: 'johnny appleseed',
          description: 'my description'
        }
      }
    end

    # positive test - it updates the movie's attributes
    it "updates a movie's attributes" do
      movie = Movie.new(movie_params[:movie])

      movie[:director] = 'orlando bloom'

      expect(movie[:director]).to eq('orlando bloom')
    end

    it "redirects to the movie index page" do
      patch :update, movie_params
      expect(subject).to redirect_to(movie_path(assigns(movie_params[:movie]).id))
    end
  end # PATCH update test end

end # Rspec end



