require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "renders the :index view" do
      movie = Movie.new(id: 1, title: "a title")
      movie.save
      get :index

      expect(response).to render_template("index")
      # expect(response.body).to eq("")
    end
  end

  describe "GET #show" do
    it "locates the correct Movie" do
      movie1 = Movie.new(id: 1, title: "a title")
      movie1.save
      movie2 = Movie.new(id: 2, title: "b title")
      movie2.save
      params = { id: 2 }

      expect(Movie.find(params[:id]).title).to eq("b title")
    end

    it "renders the :show view" do
      movie = Movie.new(id: 1, title: "a title")
      movie.save
      get :show, id: 1

      expect(response).to render_template("show")
    end
  end

  describe "DELETE #destroy" do
    before :each do
      movie1 = Movie.new(id: 1, title: "a title")
      movie1.save
      @movie2 = Movie.new(id: 2, title: "b title")
      @movie2.save
    end

    it "locates the correct Movie" do
      params = { id: 1 }

      expect(Movie.find(params[:id]).title).to eq("a title")
    end

    it "deletes the movie" do
      expect(Movie.all).to include(@movie2)

      @movie2.destroy
      expect(Movie.all).to_not include(@movie2)
    end

    # redirects to :index
  end
end
