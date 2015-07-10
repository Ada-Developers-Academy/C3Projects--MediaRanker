require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    before :each do
      @movie = Movie.create(title: "Harry Potter", rank: 0)
    end

    let(:description_params) { { id: @movie.id, movie: { description: "yes" } } }
    let(:title_params) { { id: @movie.id, movie: { title: "" } } }

    context "When upvote is pressed" do
      # positive test - when upvote is pressed, it only updates the rank
      it "updates the rank by one when upvote is pressed" do
        put :update, id: @movie.id

        expect(Movie.find(@movie.id).rank).to eq 1
      end
    end

    context "Editing the form" do
      # positive test - when form is edited, it updates the form information
      it "updates the description when you edit the form" do
        put :update, description_params

        expect(Movie.find(@movie.id).description).to eq "yes"
      end

      # when it updates the form information, the upvote isn't changed
      it "doesn't change the rank when you update the description" do
        put :update, description_params

        expect(Movie.find(@movie.id).rank).to eq 0
      end

      context "The record has a name!" do
        # it redirects to the show page
        it "redirects to the movie show page" do
          put :update, description_params
          expect(subject).to render_template(:show)
        end
      end

      context "The record doesn't have a name." do
        it "doesn't save the form to the db" do
          put :update, title_params
          expect(@movie.title).to eq "Harry Potter"
        end

        it "renders the edit template again" do
          put :update, title_params
          expect(subject).to render_template(:edit)
        end
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @movie = Movie.create(title: "Harry Potter", rank: 0)
    end

    it "removes the record from the db" do
      delete :destroy, id: @movie.id
      expect(Movie.count).to eq 0
    end

    it "redirects to the movie index page after deleting" do
      delete :destroy, id: @movie.id
      expect(subject).to redirect_to(movies_path)
    end
  end

  describe "POST #create" do
    let(:movie_params) { { movie: { title: "Lord of the Rings", director: "some dude prolly" } } }
    let(:invalid_movie_params) { { movie: { director: "another dude" } } }

    it "creates a new record in the db" do
      post :create, movie_params
      expect(Movie.count).to eq 1
    end

    it "creates defaults to create a record with a ranking of zero" do
      post :create, movie_params
      expect(Movie.all.first.rank). to eq 0
    end

    it "does not create and save a record without a title" do
      post :create, invalid_movie_params
      expect(Movie.count).to eq 0
    end
  end
end
