require 'rails_helper'

RSpec.describe MediaController, type: :controller do

  describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

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
      { :name => 'new title'}
    end

    before(:each) do
      @medium = Medium.create(ranking: "4", name: "Book name", media_type: "book")
      put :update, :id => @medium.id, :medium => attr
      @medium.reload
    end

    it { expect(response).to redirect_to(@medium) }

  end
end
