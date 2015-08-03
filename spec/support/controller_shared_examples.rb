require 'spec_helper'

RSpec.shared_examples "a medium controller" do
  let (:medium) { described_class.model.new }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    before :each do
      @medium = described_class.model.create(title: 'a')
    end

    it "returns http success" do
      get :show, id: @medium
      expect(response).to be_success
    end

    it "renders the show view" do
      get :show, id: @medium
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    before :each do
      @medium = described_class.model.create(title: 'a')
    end

    it "renders the edit view" do
      get :edit, id: @medium
      expect(response).to render_template("edit")
    end
  end

  describe "PUT #update" do
    describe "upvote" do
      before :each do
        @medium = described_class.model.create(title: 'a')
      end

      it "updates votes" do
        put :update, id: @medium, upvote: "true"
        expect(described_class.model.find(1).votes).to eq 1
      end

      it "redirects to medium show view" do
        put :update, id: @medium, votes: @medium, upvote: "true"
        expect(subject).to redirect_to(polymorphic_path(@medium))
      end
    end

    describe "editing a medium" do
      context "valid medium params" do
        before :each do
          @medium = described_class.model.create(title: 'a')
          @new_params = { described_class.model.name.downcase.to_sym => { title: "b" }, id: "1" }
        end

        it "updates a medium" do
          put :update, @new_params
          expect(described_class.model.find(1).title).to eq 'b'
        end

        it "redirects to medium show view" do
          put :update, @new_params
          @medium.reload
          expect(response).to redirect_to(polymorphic_path(@medium))
        end
      end

      context "invalid medium new_params" do
        before :each do
          @medium = described_class.model.create(title: 'a')
          @new_params = { described_class.model.name.downcase.to_sym => { title: "" }, id: "1" }
        end

        it "does not update the medium" do
          put :update, @new_params
          @medium.reload
          expect(@medium.title).to eq 'a'
        end

        it "renders the edit page so the record can be fixed" do
          put :update, @new_params
          @medium.reload
          expect(response).to render_template("edit")
        end
      end
    end
  end

  describe "GET #new" do
    it "renders the new view" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "valid medium params" do
      before :each do
        @new_params = { described_class.model.name.downcase.to_sym => { title: "a" }, id: "1" }
      end

      it "creates a medium" do
        post :create, @new_params
        expect(described_class.model.count).to eq 1
      end

      it "redirects to the medium show page" do
        post :create, @new_params
        new_medium = described_class.model.last
        expect(subject).to redirect_to(polymorphic_path(new_medium))
      end
    end

    context "invalid medium params" do
      before :each do
        @new_params = { described_class.model.name.downcase.to_sym => { title: "" }, id: "1" }
      end

      it "does not persist invalid records" do
        post :create, @new_params
        expect(described_class.model.count).to eq 0
      end

      it "renders the new page so the record can be fixed" do
        post :create, @new_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @medium = described_class.model.create(title: 'a')
    end

    it "deletes a medium" do
      post :destroy, id: @medium
      expect(described_class.model.count).to eq 0
    end

    it "redirects to the medium index page" do
      post :destroy, id: @medium
      expect(subject).to redirect_to(polymorphic_path(described_class.model))
    end
  end
end
