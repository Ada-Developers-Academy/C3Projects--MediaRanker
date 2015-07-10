require 'spec_helper'

RSpec.shared_examples "a media" do

  let(:medium) { described_class.model.new() }

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
    before :each do
      @medium = described_class.model.new
    end

    it "saves a new blank instance of medium in a variable" do
      get :new
      expect(@medium.name).to eq nil
    end

    it "renders a new page" do
      get :new
      expect(subject).to render_template(:new)
    end
  end

  describe "GET show" do
    it "locates the correct record" do
      medium1 = described_class.model.new(id: 1, name: "some", creator: "okay", description: "blah blah", rank: 4)
      medium1.save
      params = { id: 1}

      expect(described_class.model.find(params[:id]).name).to eq ("some")
    end
  end

  describe "POST upvote" do
    it "adds 1 to the rank" do
      medium1 = described_class.model.new(id: 1, name: "some", creator: "okay", description: "blah blah", rank: 4)
      medium1.save
      params = { id: 1 }

      post :upvote, params
      medium1.reload

      expect(medium1.rank).to eq 5
    end
  end

  describe "PATCH update" do
    before :each do
      @medium1 = described_class.model.new(id: 1, name: "any old name")
      @medium1.save
    end

    it "locates the correct described_class.model" do
      params = { id: 1 }
      expect(described_class.model.find(params[:id]).name).to eq("any old name")
    end
  end

  describe "DELETE destroy" do
    before :each do
      @medium1 = described_class.model.new(id: 1, name: "any old name")
      @medium1.save
    end

    it "deletes medium1 from the database" do
      delete :destroy, id: @medium1.id, medium1: { id: 1, name: "any old name" }

      expect(described_class.model.count).to eq 0
    end
  end
end
