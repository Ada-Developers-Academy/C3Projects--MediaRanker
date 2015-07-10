require 'rails_helper'

RSpec.describe MediaController, type: :controller do
  describe "#new" do
    it "creates a new item" do
      album = Medium.new
      get :new
      expect(album).to be_a_new(Medium)
    end
  end

  let(:media_params) do
    {
      medium: {
        name: "Kiss Land", 
        description: "Debut studio album", 
        creator: "The Weekend",
        format: 'album'
      }

    }
  end

  describe "#create" do
    before(:each) do
      post :create, media_params
    end
    context "using correct attributes" do
      it "creates a new Medium" do
        expect(Medium.all.count).to eq(1)
      end
      it "adds the correct format" do
        album = Medium.create(media_params[:medium])
        
        expect(album.format).to eq "album"
      end
    end
  end

  let(:album) {Medium.create(media_params[:medium])}
 
  describe "#edit" do
    it "finds a specific media" do
      get :edit, id: album
      expect(assigns(:media)).to eq(album)
    end
  end

  describe "#update" do
    it "updates an item with valid params" do
      post :update, id: album, medium: {name: "kiss the dirt"}
      album.reload
      expect(album.name).to eq("kiss the dirt")  
    end
  end
end















