require 'rails_helper'

RSpec.describe MediaController, type: :controller do

  describe "GET #index" do

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    media_types = { book: "books", movie: "movies", album: "albums" }
    media_types.each do |type, instance_variable|
      it "loads media into @#{instance_variable}" do
        medium1 = Medium.create!(name: "new1", media_type: type)
        medium2 = Medium.create!(name: "new2", media_type: type)
        get :index

        expect(assigns(:"#{instance_variable}")).to match_array([medium1, medium2])
      end
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

      # let (:params) do
      #   {
      #     from: "book"
      #   }
      # end

      it "deletes a medium record" do
        @medium = Medium.create!(ranking: "4", name: "Book name", media_type: "book")
        expect { delete :destroy, :id => @medium.id, :from => "book" }.to change(Medium, :count).by(-1)
        # Since my redirect filepath relies on a "from" key in params, I included a specific key/value here
      end
    end
  end

  describe "upboat" do
    it "increases ranking when upboat method is used" do
      @medium = Medium.create!(name: "Book name", media_type: "book")
      post :upvote, :id => @medium.id
      @medium.reload
      expect(@medium.ranking).to eq 1
    end
  end

end
