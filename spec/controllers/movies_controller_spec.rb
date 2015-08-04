require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  # GET specs ----------------------------------------------------------------
    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  # POST specs ---------------------------------------------------------------
    describe "POST #create" do
      context "Invalid movie params" do
        let(:album_params) do
          {
            movie: {
              title: "Starlord"
            }
          }
        end

        it "doesn't persist invalid records" do
          post :create, album_params
          expect(Movie.count).to eq(0)
        end

        it "renders the :new view (to allow user to fix input)" do
          post :create, album_params
          expect(response).to render_template("new")
        end
      end

      context "Valid movie params" do
        let(:album_params) do
          {
            movie: {
              title: "I feel good",
              author: "dananananah",
              description: "I feel good!"
            }
          }
        end

        it "save a new movie" do
          post :create, album_params
          expect(Movie.count).to eq(1)
        end

        it "redirects to the movie index page after saving" do
          post :create, album_params
          expect(response).to redirect_to(albums_path)
        end
      end
   # PATCH specs --------------------------------------------------------------------
      describe "PATCH #update" do
        before(:each) do
          @movie = Movie.new(title: "first title", author: "first author")
          @movie.save
        end

        after(:each) do
          @movie.destroy
        end

        context "Invalid data for update of movie" do
          it "renders the edit form for invalid input" do
            patch :update, id: @movie, :movie => {title: ''}
            expect(subject).to render_template("edit")
          end
        end

        context "Valid data for update of movie" do
          it "redirects to movie details after updating" do
            patch :update, id: @movie.id, :movie => {title: 'new title'}
            @movie.reload
            expect(@movie.title).to eq("new title")
            expect(response).to redirect_to(album_path(@movie.id))
          end
        end
      end
    end
end
