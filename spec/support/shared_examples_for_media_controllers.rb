require 'spec_helper'

RSpec.shared_examples "a MediumController" do
  let(:model_string) { described_class.model.to_s.downcase }
  let(:medium_path) { model_string + "_path" }
  let(:mediums_path) { model_string + "s_path" }
  let(:medium_symbol) { model_string.to_sym }

  describe "GET #index" do
    before :each do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders index template" do
      expect(response).to render_template("shared/index")
    end
  end

  describe "GET #show" do
    let(:medium) { described_class.model.create(title: 'some title', creator: 'some creator') }

    before :each do
      get :show, id: medium
    end

    it "finds a specific medium" do
      expect(assigns(:medium)).to eq(medium)
    end

    it "renders show template" do
      expect(response).to render_template("shared/show")
    end
  end

  describe "GET #new" do
    before :each do
      get :new
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the :new template" do
      expect(subject).to render_template("shared/form")
    end

    it "creates a new medium" do
      expect(assigns(:medium)).to be_a_new(described_class.model)
    end
  end

  describe "POST #create" do
    # positive test - medium params are valid
    context "valid medium params" do
      let(:medium_params) do
        { medium_symbol => { title: 'some medium', rank: 5 } }
      end

      before(:each) do
        post :create, medium_params
      end

      it "creates an described_class record" do
        expect(described_class.model.count).to eq 1
      end

      it "redirect to the medium show page" do
        expect(subject).to redirect_to(send(medium_path, assigns(medium_symbol)))
      end
    end

    # negative test - medium params are invalid
    context "invalid medium params" do
      let(:medium_params) do
        { medium_symbol => { rank: 5 } } # missing the title key
      end

      before :each do
        post :create, medium_params
      end

      it "does not persist invalid records" do
        expect(described_class.model.count).to eq 0
      end

      it "renders the new template" do
        expect(response).to render_template("shared/form")
      end
    end
  end

  describe "GET #edit" do
    let(:medium) { described_class.model.create(title: 'some title', creator: 'some creator') }
    
    before(:each) do
      get :edit, id: medium
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "finds a specific medium" do
      expect(assigns(:medium)).to eq(medium)
    end

    it "renders the :edit template" do
      expect(subject).to render_template("shared/form")
    end
  end

  describe "PUT #update" do
    let(:medium) { described_class.model.create(title: 'some title', creator: 'some person') }

    context "valid medium params" do
      before(:each) do
        # binding.pry
        post :update, id: medium, medium_symbol => { title: "updated title", creator: 'some person' }
      end

      it "updates an medium with valid params" do
        medium.reload
        expect(medium.title).to eq("updated title")
      end

      it "redirects to medium_path" do
        expect(subject).to redirect_to(send(medium_path, assigns(:medium)))
      end
    end

    context "invalid medium params" do
      before(:each) do
        post :update, id: medium, medium_symbol => { title: "", creator: 'some person' }
      end

      it "does not update an item with invalid params" do
        medium.reload
        expect(medium.title).to eq("some title")
      end

      it "renders :edit template" do
        expect(response).to render_template("shared/form")
      end
    end
  end

  describe "PUT #upvote" do
    let(:medium) { described_class.model.create(title: 'a title', rank: 5) }

    it "increases rank of record by one" do
      put :upvote, id: medium
      medium.reload

      expect(medium.rank).to eq 6
    end

    it "only affects the particular record" do
      medium2 = described_class.model.create(title: 'b title', rank: 5)

      put :upvote, id: medium
      medium.reload
      medium2.reload

      expect(medium2.rank).to eq 5
    end

    it "redirects to the medium_path" do
      put :upvote, id: medium
      expect(subject).to redirect_to(send(medium_path, assigns(:medium)))
    end
  end

  describe "DELETE #destroy" do
    let(:medium1) { described_class.model.create(title: 'a title', creator: 'a person') }
    let(:medium2) { described_class.model.create(title: 'b title', creator: 'b person') }
    let(:medium3) { described_class.model.create(title: 'c title', creator: 'c person') }

    before(:each) do
      delete :destroy, id: medium3
    end

    it "deletes a particular object" do
      expect(described_class.model.all).to_not include medium3
    end

    it "redirects to the mediums_path" do
      expect(response).to redirect_to(send(mediums_path))
    end
  end
end
