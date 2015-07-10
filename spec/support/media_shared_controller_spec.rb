require 'spec_helper'

RSpec.shared_examples "a media" do

  let(:medium) { described_class.model.new() }

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "locates the correct record" do
      medium1 = described_class.model.new(id: 1, name: "some", creator: "okay", description: "belh", rank: 4)
      medium1.save
      params = { id: 1}

      expect(described_class.model.find(params[:id]).name).to eq ("some")
    end
  end
end
