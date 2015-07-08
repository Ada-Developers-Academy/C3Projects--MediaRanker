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
    context "valid movie params" do
      let(:movie_params) do
        {
          movie: {
            name: "title",
            author: "author",
            desc: "desc",
            vote: 2
          }
        }
      end

      it "creates a Movie record" do
        post :create, movie_params
        expect(Movie.count).to eq 1
      end

      it "redirects to the Movie show page" do
        post :create, movie_params
        expect(subject).to redirect_to(movie_path(assigns(:movie)))
      end
    end

    context "invalid movie params" do
      let (:movie_params) do
        {
          movie: { 
            author: "author",
            desc: "desc",
            vote: 2
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
      @movie = Movie.create(name: "name")
    end
    
    context "valid movie params" do
      it "updates an existing movie record" do
        patch :update, id: @movie.id, movie: { name: "title" }
        @movie.reload
        expect(@movie.name).to eq "title"
      end

      it "redirects to the Movie show page" do
        patch :update, id: @movie.id, movie: { name: "title" }
        @movie.reload
        expect(subject).to redirect_to(movie_path)
      end
    end

    context "invalid movie params" do
      it "does not persist invalid record updates" do
        patch :update, id: @movie.id, movie: { desc: "desc" }
        expect(subject).to redirect_to(movie_path)
      end
    end
  end

  describe "POST #upvote" do
    before :each do 
      @movie = Movie.create(name: "name", vote: 0)
    end

    context "clicking upvote button" do
      it "increases the upvote count by 1" do
        post :upvote, id: @movie.id
        @movie.reload
        expect(@movie.vote).to eq 1
      end

      it "redirects to the Movie show page" do
        patch :upvote, id: @movie.id
        @movie.reload
        expect(subject).to redirect_to(movie_path)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do 
      @movie = Movie.create(name: "name")
    end

    context "clicking the delete button" do
      it "removes a record" do
        delete :destroy, id: @movie.id
        expect(Movie.count).to eq 0
      end

      it "redirects to the Movie show page" do
        delete :destroy, id: @movie.id
        expect(subject).to redirect_to(movies_path)
      end
    end
  end
end
