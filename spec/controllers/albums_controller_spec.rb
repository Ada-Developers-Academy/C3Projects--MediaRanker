require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  context "when newing up an Album" do
    before(:each) do
      get :new
    end

    it "creates a new Album" do
      expect(assigns(:album)).to be_a_new(Album)
    end
  end

end
