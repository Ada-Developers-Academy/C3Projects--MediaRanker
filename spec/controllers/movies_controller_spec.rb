require 'rails_helper'
require 'support/shared_examples_for_media_controllers'

RSpec.describe MoviesController, type: :controller do
  describe MoviesController do
    it_behaves_like "a MediumController"
  end

  # describe "GET #index" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :index

  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end

  #   it "renders index template" do
  #     get :index

  #     expect(response).to render_template("index")
  #   end
  # end

  # describe "GET #new" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :new

  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end

  #   it "renders the :new template" do
  #     get :new

  #     expect(subject).to render_template("new")
  #   end

  #   # test which model it's creating a new form for
  #   it "creates a new movie" do
  #     get :new

  #     expect(assigns(:movie)).to be_a_new(Movie)
  #   end
  # end

  # describe "POST #create" do
  #   # positive test - movie params are valid
  #   context "valid movie params" do
  #     let(:movie_params) do
  #       { movie: { title: 'some movie', rank: 5 } }
  #     end

  #     before(:each) do
  #       post :create, movie_params
  #     end

  #     it "creates an Movie record" do
  #       expect(Movie.count).to eq 1
  #     end

  #     it "redirect to the movie show page" do
  #       expect(subject).to redirect_to(movie_path(assigns(:movie)))
  #     end
  #   end

  #   # negative test - movie params are invalid
  #   context "invalid movie params" do
  #     let(:movie_params) do
  #       {
  #         movie: { # missing the title key
  #           rank: 5
  #         }
  #       }
  #     end

  #     it "does not persist invalid records" do
  #       post :create, movie_params
  #       expect(Movie.count).to eq 0
  #     end

  #     it "renders the new template" do
  #       post :create, movie_params
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "GET #edit" do
  #   let(:movie) { Movie.create(title: 'some title', creator: 'some creator') }
    
  #   before(:each) do
  #     get :edit, id: movie
  #   end

  #   it "responds successfully with an HTTP 200 status code" do
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end

  #   it "finds a specific movie" do
  #     expect(assigns(:movie)).to eq(movie)
  #   end

  #   it "renders the :edit template" do
  #     expect(subject).to render_template("edit")
  #   end
  # end

  # describe "PUT #update" do
  #   before(:each) do
  #     @movie = Movie.create(title: 'some title', creator: 'some person')
  #   end

  #   context "valid movie params" do
  #     before(:each) do
  #       post :update, id: @movie, movie: { title: "updated title", creator: 'some person' }
  #     end

  #     it "updates a movie with valid params" do
  #       @movie.reload
  #       expect(@movie.title).to eq("updated title")
  #     end

  #     it "redirects to movie_path" do
  #       expect(subject).to redirect_to(movie_path(assigns(:movie)))
  #     end
  #   end

  #   context "invalid movie params" do
  #     before(:each) do
  #       post :update, id: @movie, movie: { title: "", creator: 'some person' }
  #     end

  #     it "does not update an item with invalid params" do
  #       @movie.reload
  #       expect(@movie.title).to eq("some title")
  #     end

  #     it "renders :edit template" do
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "PUT #upvote" do

  #   before(:each) do
  #     @movie = Movie.create(title: 'a title', rank: 5)
  #     put :upvote, id: @movie
  #   end

  #   it "increases rank of record by one" do
  #     @movie.reload
  #     expect(@movie.rank).to eq 6
  #   end

  #   it "only affects the particular record" do
  #     movie2 = Movie.create(title: 'b title', rank: 5)

  #     @movie.reload
  #     movie2.reload
  #     expect(@movie.rank).to eq 6
  #     expect(movie2.rank).to eq 5
  #   end

  #   it "redirects to the movie_path" do
  #     expect(subject).to redirect_to(movie_path(assigns(:movie)))
  #   end
  # end

  # describe "DELETE #destroy" do
  #   before(:each) do
  #     @movie1 = Movie.create(title: 'a title', creator: 'a person')
  #     @movie2 = Movie.create(title: 'b title', creator: 'b person')
  #     @movie3 = Movie.create(title: 'c title', creator: 'c person')

  #     delete :destroy, id: @movie3
  #   end

  #   it "deletes a particular object" do
  #     expect(Movie.all).to_not include @movie3
  #   end

  #   it "redirects to the movies_path" do
  #     expect(response).to redirect_to(movies_path)
  #   end
  # end
end
