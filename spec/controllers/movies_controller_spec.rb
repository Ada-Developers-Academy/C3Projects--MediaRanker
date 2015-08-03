require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    let(:movie) do
      Movie.create(name: "Test Name")
    end

    it "responds successfully with HTTP 200 status code" do
      get :show, id: movie

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "responds successfully with HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "valid params" do
      let(:movie_params) do
        {
          movie: {
            name: "Test Name",
            description: "nope"
          }
        }
      end

      it "creates a record" do
        post :create, movie_params

        expect(Movie.count).to eq(1)
      end

      it "redirects to #show" do
        post :create, movie_params

        expect(response).to redirect_to(movie_path(Movie.last))
      end
    end

    context "invalid params" do
      let(:invalid_movie_params) do
        {
          movie: {
            # no :name, which is required,
            description: "nope"
          }
        }
      end

      it "doesn't create invalid records" do
        post :create, invalid_movie_params

        expect(Movie.count).to eq(0)
      end

      it "renders #new" do
        post :create, invalid_movie_params

        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:movie) do
      Movie.create(name: "Test Name")
    end

    it "responds successfully with HTTP 200 status code" do
      get :edit, id: movie

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    let(:movie) do
      Movie.create(name: "Test Name")
    end

    it "updates a record" do
      put :update, id: movie, movie: { name: "Changed Name" }
      movie.reload

      expect(movie.name).to eq("Changed Name")
    end

    it "on successful update, redirects to #show" do
      post :update, id: movie, movie: { description: "Changed Name" }

      expect(response).to redirect_to(movie_path(movie))
    end

    it "on unsuccessful update, renders #edit" do
      post :update, id: movie, movie: { name: nil }

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("edit")
    end
  end

  describe "DELETE #destroy" do
    let(:movie) do
      Movie.create(name: "Test Name")
    end

    it "has one record" do
      movie
      
      expect(Movie.count).to eq(1)
    end

    it "destroys a record" do
      delete :destroy, id: movie

      expect(Movie.count).to eq(0)
    end

    it "redirects to #index" do
      delete :destroy, id: movie

      expect(response).to redirect_to(movies_path)
    end
  end

  describe "POST #upvote" do
    let(:movie) do
      Movie.create(name: "Test Name")
    end

    it "defaults :rank to 0 on record creation" do
      expect(movie.rank).to eq(0)
    end

    it "increments :rank by 1" do
      post :upvote, id: movie
      movie.reload

      expect(movie.rank).to eq(1)
    end

    it "increments :rank multiple times" do
      10.times do
        post :upvote, id: movie
      end
      movie.reload

      expect(movie.rank).to eq(10)
    end

    it "redirects to #show" do
      post :upvote, id: movie

      expect(response).to redirect_to(movie_path(movie))
    end
  end
end
