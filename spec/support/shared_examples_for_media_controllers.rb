require 'spec_helper'

RSpec.shared_examples "a MediumController" do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders index template" do
      get :index

      expect(response).to render_template("index")
    end

    # check for displaying all elements
  end

  describe "GET #show" do
    let(:medium) { described_class.model.create(title: 'some title', creator: 'some creator') }

    before :each do
      get :show, id: medium
    end

    it "finds a specific medium" do
      # binding.pry
      expect(assigns(described_class.medium_symbol)).to eq(medium)
    end

    it "renders show template" do
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the :new template" do
      get :new

      expect(subject).to render_template("new")
    end

    # test which model it's creating a new form for
    it "creates a new medium" do
      get :new

      expect(assigns(described_class.medium_symbol)).to be_a_new(described_class.model)
    end
  end

  describe "POST #create" do
    # positive test - medium params are valid
    context "valid medium params" do
      let(:medium_params) do
        { described_class.medium_symbol => { title: 'some medium', rank: 5 } }
      end

      before(:each) do
        post :create, medium_params
      end

      it "creates an described_class record" do
        expect(described_class.model.count).to eq 1
      end

      it "redirect to the medium show page" do
        expect(subject).to redirect_to(send(described_class.medium_path, assigns(described_class.medium_symbol)))
      end
    end

    # negative test - medium params are invalid
    context "invalid medium params" do
      let(:medium_params) do
        {
          described_class.medium_symbol => { # missing the title key
            rank: 5
          }
        }
      end

      it "does not persist invalid records" do
        post :create, medium_params
        expect(described_class.model.count).to eq 0
      end

      it "renders the new template" do
        post :create, medium_params
        expect(response).to render_template("new")
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
      expect(assigns(described_class.medium_symbol)).to eq(medium)
    end

    it "renders the :edit template" do
      expect(subject).to render_template("edit")
    end
  end

  describe "PUT #update" do
    before(:each) do
      @medium = described_class.model.create(title: 'some title', creator: 'some person')
    end

    context "valid medium params" do
      before(:each) do
        post :update, id: @medium, described_class.medium_symbol => { title: "updated title", creator: 'some person' }
      end

      it "updates an medium with valid params" do
        @medium.reload
        expect(@medium.title).to eq("updated title")
      end

      it "redirects to medium_path" do
        expect(subject).to redirect_to(send(described_class.medium_path, assigns(described_class.medium_symbol)))
      end
    end

    context "invalid medium params" do
      before(:each) do
        post :update, id: @medium, described_class.medium_symbol => { title: "", creator: 'some person' }
      end

      it "does not update an item with invalid params" do
        @medium.reload
        expect(@medium.title).to eq("some title")
      end

      it "renders :edit template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "PUT #upvote" do

    before(:each) do
      @medium = described_class.model.create(title: 'a title', rank: 5)
      put :upvote, id: @medium
    end

    it "increases rank of record by one" do
      @medium.reload
      expect(@medium.rank).to eq 6
    end

    it "only affects the particular record" do
      medium2 = described_class.model.create(title: 'b title', rank: 5)

      @medium.reload
      medium2.reload
      expect(@medium.rank).to eq 6
      expect(medium2.rank).to eq 5
    end

    it "redirects to the medium_path" do
      expect(subject).to redirect_to(send(described_class.medium_path, assigns(described_class.medium_symbol)))
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @medium1 = described_class.model.create(title: 'a title', creator: 'a person')
      @medium2 =  described_class.model.create(title: 'b title', creator: 'b person')
      @medium3 =  described_class.model.create(title: 'c title', creator: 'c person')

      delete :destroy, id: @medium3
    end

    it "deletes a particular object" do
      expect(described_class.model.all).to_not include @medium3
    end

    it "redirects to the mediums_path" do
      expect(response).to redirect_to(send(described_class.mediums_path))
    end
  end
end
