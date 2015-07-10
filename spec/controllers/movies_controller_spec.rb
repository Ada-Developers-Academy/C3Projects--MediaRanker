require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller"

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "valid movie params" do
      let(:movie_params) do
        {
          movie: {
            title: "a title",
            director: "an artist",
            rank: 20,
            description: "a description"
          }
        }
      end

      it "creates a Movie record" do
        post :create, movie_params
        expect(Movie.count).to eq 1
      end

      it "redirects to the movie show page" do
        post :create, movie_params
        expect(subject).to redirect_to(movie_path(assigns(:movie)))
      end

      context "record in which only the title is specified" do
        let(:minimal_movie_params) do
          { movie: { title: "a title" } }
        end

        it "creates a Movie record" do
          post :create, minimal_movie_params
          expect(Movie.count).to eq 1
        end

        it "sets value of rank to 0" do
          post :create, minimal_movie_params
          expect(Movie.first.rank).to eq 0
        end

        it "redirects to the movie show page" do
          post :create, minimal_movie_params
          expect(subject).to redirect_to(movie_path(assigns(:movie)))
        end
      end
    end

    context "invalid movie params" do
      let(:movie_params) do
        { movie: { director: "a director" } }
      end

      it "does not persist a Movie record" do
        post :create, movie_params
        expect(Movie.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, movie_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update/:id" do
    let(:attr) do
      { title: "new title",
        director: "new director",
        description: "new description" }
    end

    before :each do
      @movie = Movie.create(title: "a title", director: "an artist", rank: 20, description: "a description")
      put :update, :id => @movie.id, :movie => attr
      @movie.reload
    end

    it "updates the movie record" do
      expect(response).to redirect_to(@movie)
      expect(@movie.title).to eq "new title"
      expect(@movie.director).to eq "new director"
      expect(@movie.description).to eq "new description"
    end

    it "redirects to the movie show page" do
      expect(subject).to redirect_to(movie_path(assigns(:movie)))
    end
  end


  describe "GET #show" do
    before :each do
      @movie = Movie.create(title: "a title", director: "an artist", rank: 20, description: "a description")
    end

    it "shows the selected movie" do
      get :show, id: @movie

      expect { assigns(:movie).to eq(@movie) }
    end

    it  "renders the #show template" do
      get :show, id: @movie.id
      expect(subject).to render_template :show
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @movie = Movie.create(title: "a title", director: "an artist", rank: 20, description: "a description")
    end

    it "deletes the record" do
      expect{
        delete :destroy, id: @movie
        }.to change(Movie, :count).by(-1)
    end

    it "redirects to movies_path" do
      delete :destroy, id: @movie
      expect(response).to redirect_to movies_path
    end
  end

  describe "PATCH #upvote" do
    before :each do
      @movie = Movie.create(title: "a title", director: "an artist", rank: 20, description: "a description")
      patch :upvote, id: @movie
      @movie.reload
    end

    it "increases the rank by 1" do
      expect(@movie.rank).to eq 21
    end

    it "redirects to movies_path" do
      patch :upvote, id: @movie
      expect(response).to redirect_to movie_path(@movie.id)
    end
  end


end
