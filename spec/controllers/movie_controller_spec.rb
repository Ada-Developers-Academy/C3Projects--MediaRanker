require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

    describe MoviesController do
      it_behaves_like "a media"
    end

    describe "POST create" do
      context "valid params" do
        let (:params) do {movie: {id: 2, name: "a name", creator: "someone", description: "whatever" }}

        end

        it "creates a new Movie record" do
          post :create, params

          expect(Movie.count).to eq 1
        end

        it "redirects to the album show page" do
          post :create, params

          expect(subject).to redirect_to(movie_path(assigns(:movie)))
        end
      end

      context "invalid params" do
        let (:params) do {movie: {id: 2, creator: "a person", description: "something" }}
        end

        it "does not persist into the database" do
          post :create, params

          expect(Movie.count).to eq 0
        end

        it "renders the new action" do
          post :create, params

          expect(response).to render_template("new")
        end
      end
    end

  describe "PATCH update" do
    before :each do
      @movie1 = Movie.new(id: 1, name: "any old name")
      @movie1.save

      @params = { movie: { name: "A new name" }}
    end

    it "locates the correct described_class.model" do
      params = { id: 1 }
      expect(Movie.find(params[:id]).name).to eq("any old name")
    end

    # it "updates an existing record" do
    #   original_name = @movie1.name
    #   patch :update, @params
    #   @movie1.reload


    #   expect(@movie1.name).to_not eq original_name
    # end
  end
end
