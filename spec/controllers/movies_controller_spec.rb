require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "renders the :index view" do
      movie = Movie.new(id: 1, title: "a title")
      movie.save
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "locates the correct Movie" do
      @movie1 = Movie.new(id: 1, title: "a title")
      @movie1.save
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

  describe "GET #edit" do
    # copy pasta'd from GET #show
    # is this even good?
    it "locates the correct Movie" do
      @movie1 = Movie.new(id: 1, title: "a title")
      @movie1.save
      movie2 = Movie.new(id: 2, title: "b title")
      movie2.save
      params = { id: 2 }

      expect(Movie.find(params[:id]).title).to eq("b title")
    end
  end

  describe "PUT #update" do
    before :each do
      @movie1 = Movie.new(id: 1, title: "a title")
      @movie1.save
      @movie2 = Movie.new(id: 2, title: "b title")
      @movie2.save
      Movie.new(id: 3, title: "c title").save

      @params = { movie: { title: "Reservoir Dogs", director: "Quentin Tarantino", description: "" }, id: "2" }
    end

    it "locates the correct Movie" do
      params = { id: 1 }
      expect(Movie.find(params[:id]).title).to eq("a title")
    end

    it "updates and saves the new information" do
      original_title       = @movie2.title
      original_director    = @movie2.director
      original_description = @movie2.description
      put :update, @params
      @movie2.reload

      expect(@movie2.title).to_not       eq original_title
      expect(@movie2.director).to_not    eq original_director
      expect(@movie2.description).to_not eq original_description
    end

    it "doesn't create a new object" do
      original_count = Movie.all.count
      put :update, @params

      expect(original_count).to eq Movie.all.count
    end

    it "redirects to the movie's :show view" do
      put :update, @params
      expect(subject).to redirect_to(movie_path(@movie2))
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @movie1 = Movie.new(id: 1, title: "a title")
      @movie1.save
      @movie2 = Movie.new(id: 2, title: "b title")
      @movie2.save
      Movie.new(id: 3, title: "c title").save
    end

    it "locates the correct Movie" do
      params = { id: 1 }
      expect(Movie.find(params[:id]).title).to eq("a title")
    end

    it "deletes the movie" do
      delete :destroy, id: @movie2.id
      expect(Movie.all).to_not include(@movie2)
    end

    it "redirects to the :index view" do
      delete :destroy, id: @movie1.id
      expect(subject).to redirect_to(media_path)
    end
  end
end
