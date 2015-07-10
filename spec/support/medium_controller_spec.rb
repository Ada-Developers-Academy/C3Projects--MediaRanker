require 'spec_helper'

RSpec.shared_examples "a medium controller" do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    let(:medium) { described_class.model.first }

    context "valid #{described_class.model} params" do
      it "creates a #{described_class.model} record" do
        post :create, params
        expect(described_class.model.count).to eq 1
      end

      it "sets value of rank to 0" do
        post :create, params
        expect(medium.rank).to eq 0
      end

      it "redirects to the show page" do
        post :create, params
        expect(subject).to redirect_to(polymorphic_path(medium))
      end

      context "record in which only the title is specified" do
        it "creates a record" do
          post :create, minimal_params
          expect(described_class.model.count).to eq 1
        end
      end
    end

    context "invalid params" do
      it "does not persist a #{described_class.model} record" do
        post :create, invalid_params
        expect(described_class.model.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, invalid_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update/:id" do
    let(:attr) do
      { id: @medium.id,
        title: "new title",
        description: "new description" }
    end

    before :each do
      @medium = described_class.model.create(title: "a title", rank: 20, description: "a description")

      put :update, :id => @medium.id, medium_name => attr
      @medium.reload
    end

    it "updates the #{described_class.model} record" do
      expect(response).to redirect_to(@medium)
      expect(@medium.title).to eq "new title"
      expect(@medium.description).to eq "new description"
    end

    it "redirects to the #{described_class.model} show page" do
      expect(subject).to redirect_to(polymorphic_path(@medium))
    end
  end


  describe "GET #show" do
    before :each do
      @medium = described_class.model.create(title: "a title", rank: 20, description: "a description")
    end

    it "shows the selected #{described_class.model}" do
      get :show, id: @medium

      expect { assigns(:medium).to eq(@medium) }
    end

    it  "renders the #show template" do
      get :show, id: @medium
      expect(subject).to render_template :show
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @medium = described_class.model.create(title: "a title", rank: 20, description: "a description")
    end

    it "deletes the record" do
      expect{
        delete :destroy, id: @medium
      }.to change(described_class.model, :count).by(-1)
    end

    it "redirects to index view" do
      delete :destroy, id: @medium
      expect(response).to redirect_to polymorphic_path(described_class.model)
    end
  end

  describe "PATCH #upvote" do
    before :each do
      @medium = described_class.model.create(title: "a title", rank: 20, description: "a description")
      patch :upvote, id: @medium
      @medium.reload
    end

    it "increases the rank by 1" do
      expect(@medium.rank).to eq 21
    end

    it "redirects to #{described_class.model}_path" do
      patch :upvote, id: @medium
      expect(response).to redirect_to polymorphic_path(@medium)
    end
  end
end
