require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #show" do
    it "locates the correct Album" do
      album1 = Album.new(id: 1, title: "a title")
      album1.save
      album2 = Album.new(id: 2, title: "b title")
      album2.save
      params = { id: 2 }

      expect(Album.find(params[:id]).title).to eq("b title")
    end

    it "renders the :show view" do
      album = Album.new(id: 1, title: "a title")
      album.save
      get :show, id: 1

      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    # copy pasta'd from GET #show
    # is this even good? NOPE. Re-do!
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
      album1 = Album.new(id: 1, title: "a title")
      album1.save
      @album2 = Album.new(id: 2, title: "b title")
      @album2.save
      Album.new(id: 3, title: "c title").save

      @params = { album: { title: "If You're Reading This It's Too Late", artist: "Drake", description: "" }, id: "2" }
    end

    it "locates the correct Album" do
      params = { id: 1 }
      expect(Album.find(params[:id]).title).to eq("a title")
    end

    it "updates and saves the new information" do
      original_title       = @album2.title
      original_artist      = @album2.artist
      original_description = @album2.description
      put :update, @params
      @album2.reload

      expect(@album2.title).to_not       eq original_title
      expect(@album2.artist).to_not      eq original_artist
      expect(@album2.description).to_not eq original_description
    end

    it "doesn't create a new object" do
      original_count = Album.all.count
      put :update, @params

      expect(original_count).to eq Album.all.count
    end

    it "redirects to the movie's :show view" do
      put :update, @params
      expect(subject).to redirect_to(album_path(@album2))
    end
  end
end
