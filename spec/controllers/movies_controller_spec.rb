require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like 'a MediaController', Movie, :movie, :movies_path

  describe "POST #create" do
    let(:movie_params) { { movie: { title: "Lord of the Rings", director: "some dude prolly" } } }
    let(:invalid_movie_params) { { movie: { director: "another dude" } } }

    context "Has a title!" do
      it "creates a new record in the db" do
        post :create, movie_params
        expect(Movie.count).to eq 1
      end

      it "redirects to the new record's show page" do
        post :create, movie_params
        expect(subject).to redirect_to(movie_path(id: 1))
      end

      it "creates defaults to create a record with a ranking of zero" do
        post :create, movie_params
        expect(Movie.all.first.rank). to eq 0
      end
    end

    context "Does not have a title." do
      it "does not create and save a record without a title" do
        post :create, invalid_movie_params
        expect(Movie.count).to eq 0
      end

      it "renders the edit page" do
        post :create, invalid_movie_params
        expect(subject).to render_template(:new)
      end
    end
  end
end
