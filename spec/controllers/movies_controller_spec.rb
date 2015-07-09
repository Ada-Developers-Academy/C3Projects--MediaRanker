require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "GET index" do
    it "renders the :index view for all Movies" do
       get :index
       expect(response).to render_template("index")
    end

    it "loads all of the movies into @movies" do
      movie1, movie2 = Movie.create(:name => "First Movie Name"), Movie.create(:name => "2nd Movie Name")
      get :index
      expect(assigns(:movies)).to match_array([movie1, movie2])
    end
  end

  describe "POST create" do
    context "Valid movie params" do
        let(:movie_params) do
          {
            movie: {
              name: 'Jurassic Universe',
              director: 'Spielberg',
              description: 'RAWR.',
              rank: 1
            }
          }
        end

        it "creates an Movie record" do
          post :create, movie_params
          expect(Movie.count).to eq 1
        end

        it "redirects to the movie show page" do
          post :create, movie_params
          expect(subject).to render_template("show")
        end
      end

      context "Invalid movie params" do
        let(:movie_params) do
          {
            movie: {
              director: 'Steven',
              description: 'Tiny arms galore',
              rank: 2
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

  describe "DELETE #destroy" do
    context "successful deletion" do
      it " "

    end



  # describe "GET welcome#index" do
  #   it "renders the root_path" do
  #      get :index
  #      expect(response).to render_template("index")
  #   end
  # end

end
