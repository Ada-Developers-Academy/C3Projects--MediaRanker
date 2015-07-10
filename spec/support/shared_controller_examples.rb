RSpec.shared_examples "MediaController", type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    let (:media_params) do 
      { 
        media: { name: "name" }
      }
    end

    it "creates a new instance of Media" do
      get :new, media_params
      expect(assigns(:media)).to be_kind_of(described_class.model)
    end
  end

  describe "POST #create" do
    context "valid media params" do
      let(:media_params) do
        {
          media: {
            name: "title",
            author: "author",
            desc: "desc",
            vote: 2
          }
        }
      end

      it "creates a Media record" do
        post :create, media_params
        expect(described_class.model.count).to eq 1
      end

      it "redirects to the Media show page" do
        post :create, media_params
        expect(subject).to redirect_to(media_path(assigns(:media)))
      end
    end

    context "invalid media params" do
      let (:media_params) do
        {
          media: { 
            author: "author",
            desc: "desc",
            vote: 2
          }
        }
      end

      it "does not persist invalid records" do
        post :create, media_params
        expect(described_class.model.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, media_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    before :each do 
      @media = described_class.model.create(name: "name")
    end
    
    context "valid media params" do
      it "updates an existing media record" do
        patch :update, id: @media.id, media: { name: "title" }
        @media.reload
        expect(@media.name).to eq "title"
      end

      it "redirects to the Media show page" do
        patch :update, id: @media.id, media: { name: "title" }
        @media.reload
        expect(subject).to redirect_to(media_path)
      end
    end

    context "invalid media params" do
      it "does not persist invalid record updates" do
        patch :update, id: @media.id, media: { desc: "desc" }
        expect(subject).to redirect_to(media_path)
      end
    end
  end

  describe "POST #upvote" do
    before :each do 
      @media = described_class.model.create(name: "name", vote: 0)
    end

    context "clicking upvote button" do
      it "increases the upvote count by 1" do
        post :upvote, id: @media.id
        @media.reload
        expect(@media.vote).to eq 1
      end

      it "redirects to the Media show page" do
        patch :upvote, id: @media.id
        @media.reload
        expect(subject).to redirect_to(media_path)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do 
      @media = described_class.model.create(name: "name")
    end

    context "clicking the delete button" do
      it "removes a record" do
        expect {
          delete :destroy, {:id => @media.id}
          }.to change(described_class.model, :count).by(-1)
      end

      it "redirects to the Media show page" do
        delete :destroy, id: @media.id
        expect(subject).to redirect_to(medias_path)
      end
    end
  end
end
