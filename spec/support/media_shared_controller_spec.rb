require 'spec_helper'

RSpec.shared_examples "a media" do

  let(:medium) { described_class.model.new() }

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
