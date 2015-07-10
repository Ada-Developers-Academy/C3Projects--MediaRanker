require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    let(:movie_params) do
      {
        movie: {
          name: 'new movie',
          director: 'johnny appleseed',
          description: 'this is the description'
        }
      }
    end

    before :each do
      @movie = Movie.create(movie_params[:movie])
    end

    it "renders the show template" do
      get :show, id: @movie.id

      expect(response).to have_http_status(200)
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    let(:movie_params) do
      {
        movie: {
          name: 'new movie',
          director: 'johnny appleseed',
          description: 'this is the description'
        }
      }
    end

    before :each do
      @movie = Movie.create(movie_params[:movie])
    end

    it "renders the edit template" do
      get :edit, id: @movie.id

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
    let(:movie_params) do
      {
        movie: {
          name: 'new movie',
          director: 'johnny appleseed',
          description: 'my description'
        }
      }
    end

    let(:new_movie_params) do
      {
        movie: {
          name: 'new movie',
          director: 'dave johnson',
          description: 'my description'
        }
      }
    end

    before :each do
      @movie = Movie.create(movie_params[:movie])
    end

    # positive test - it updates the movie's attributes
    it "updates a movie's attributes" do
      patch :update, id: @movie.id, movie: new_movie_params[:movie]
      @movie.reload
      expect(@movie.director).to eq('dave johnson')
    end

    it "redirects to the movie index page" do
      patch :update, id: @movie.id, movie: new_movie_params[:movie]
      @movie.reload
      expect(response).to redirect_to(movie_path(@movie))
    end
  end 

  describe "DELETE #destroy" do
    let(:movie_params) do
      {
        movie: {
          name: 'new movie',
          director: 'johnny appleseed',
          description: 'my description'
        }
      }
    end

    before :each do
      @movie = Movie.create(movie_params[:movie])
    end

    it "deletes a movie record" do
      delete :destroy, id: @movie.id
      expect(Movie.count).to eq 0
    end
  end

end # Rspec end



