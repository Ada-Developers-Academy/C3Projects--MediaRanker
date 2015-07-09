require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  context "When newing up an Album" do
    before(:each) do
      get :new
    end

    it "creates a new Album" do
      expect(assigns(:album)).to be_a_new(Album)
    end
  end

  describe "GET #index" do
    it "assigns to @albums" do
      album = Album.create(name: "Rumors", rank: 89)
      get :index
      expect(assigns(:albums)).to eq([album])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "PATCH #update" do
    it "updates the album params" do
      album = Album.create(name: "Trafic Kingdom", rank: 100)

      album.update(name: "Tragic Kingdom")

      expect(album.name).to eq("Tragic Kingdom")
    end
  end

end
