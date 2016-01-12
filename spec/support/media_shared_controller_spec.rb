RSpec.shared_examples "a media controller" do
  let(:media) { described_class.new }
  let(:media_model) { described_class.model }
  let(:media_symbol) { described_class.model.to_s.downcase.to_sym }
  let (:media_path) { described_class.model.to_s.downcase + "_path"}
  let (:medias_path) { described_class.model.to_s.downcase + "s_path"}

  describe "GET" do
    context "#index" do
      it "responds sucessfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "#new" do
      it "responds sucessfully with an HTTP 200 status code" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "#edit" do
      it "responds sucessfully with an HTTP 200 status code" do
        media = described_class.model.create(name: 'whatever')

        get :edit, {:id => '1'}
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    context "#show" do
      it "responds sucessfully with an HTTP 200 status code" do
        media = described_class.model.create(name: 'whatever')

        get :edit, {:id => '1'}
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST #create" do
    context "Valid params" do
      let(:media_params) do
        { media_symbol => { name: 'medium name' } }
      end

      it "creates a record" do
        post :create, media_params
        expect(media_model.count).to eq 1
      end

      it "redirects to the show page" do
        post :create, media_params
        expect(subject).to redirect_to(send(media_path, media_model.first))
      end
    end

    context "Invalid params" do
      let(:media_params) do
        { media_symbol => { name: nil } }
      end

      it "does not persist invalid records" do
        post :create, media_params
        expect(media_model.count).to eq 0
      end

      it "renders the :new view so user can fix missing data" do
        post :create, media_params
        expect(subject).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "Editing entry" do
      let(:attr) do
        { :name => 'new name' }
      end

      before :each do
        @old_media = media_model.create(name: 'old name')

        put :update, :id => @old_media.id, media_symbol => attr
        @old_media.reload
      end

      it "replaces entry with new info" do
        expect(@old_media.name).to eq(attr[:name])
      end

      it "redirects to the show page" do
        expect(subject).to redirect_to(send(media_path, media_model.last))
      end
    end

    context "Clicking upvote button" do
      before :each do
        @media = media_model.create(name: 'name')

        put :update, :id => @media.id
        @media.reload
      end

      it "increments ranking by 1" do
        expect(@media.ranking).to eq(1)
      end

      it "redirects to the Album show page" do
        expect(subject).to redirect_to(send(media_path, media_model.last))
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes existing entry" do
      @media = media_model.create(name: 'name')

      delete :destroy, :id => @media.id
      expect(media_model.count).to eq(0)
    end
  end
end
