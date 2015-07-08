require 'rails_helper'

RSpec.describe MediaController, type: :controller do

  describe "POST #create" do
    #positive test - when the media params are valid
    context "Valid media params" do
      let (:medium_params) do
        {
          medium: {
            ranking: "2",
            name: "Book name",
            contributor: "Book author",
            description: "Book desc",
            user: "Chococat",
            media_type: "book"
          }
        }
      end

      it "creates an media record" do
        post :create, medium_params

        expect(Medium.count).to eq 1
      end

    end
  end

  describe "PUT update/:id" do
    let(:attr) do
      { :name => "new title", :description => "new yay"}
    end

    before(:each) do
      @medium = Medium.create!(ranking: "4", name: "Book name", media_type: "book")
      put :update, :id => @medium.id, :medium => attr
      @medium.reload
    end

    it { expect(response).to redirect_to(@medium) }
    it { expect(@medium.name).to eq attr[:name] }
    it { expect(@medium.description).to eq attr[:description] }
  end

  describe "DELETE #destroy" do

    context "when deletion succeeds" do

      it "deletes the medium record" do
        @medium = Medium.create!(ranking: "4", name: "Book name", media_type: "book")
        expect { delete :destroy, :id => @medium.id }.to change(Medium, :count).by(-1)
      end
    end
  end
end
