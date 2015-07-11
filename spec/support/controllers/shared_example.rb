RSpec.shared_examples 'a MediaController' do |model_type, model_symbol, media_path, medium_path|
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do
    before :each do
      @medium = model_type.create(title: "HPCOS", description: "blah", rank: 0)
    end

    let(:description_params) { { id: @medium.id, model_symbol => { description: "yes" } } }
    let(:title_params) { { id: @medium.id, model_symbol => { title: "" } } }

    context "When upvote is pressed" do
      # positive test - when upvote is pressed, it only updates the rank
      it "updates the rank by one when upvote is pressed" do
        put :update, id: @medium.id

        expect(model_type.find(@medium.id).rank).to eq 1
      end
    end

    context "Editing the form" do
      # positive test - when form is edited, it updates the form information
      it "updates the description when you edit the form" do
        put :update, description_params

        expect(model_type.find(@medium.id).description).to eq "yes"
      end

      # when it updates the form information, the upvote isn't changed
      it "doesn't change the rank when you update the description" do
        put :update, description_params

        expect(model_type.find(@medium.id).rank).to eq 0
      end

      context "The record has a name!" do
        # it redirects to the show page
        it "redirects to the medium show page" do
          put :update, description_params
          expect(subject).to render_template(:show)
        end
      end

      context "The record doesn't have a name." do
        it "doesn't save the form to the db" do
          put :update, title_params
          expect(@medium.title).to eq "HPCOS"
        end

        it "renders the edit template again" do
          put :update, title_params
          expect(subject).to render_template(:edit)
        end
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @medium = model_type.create(title: "Harry Potter", rank: 0)
    end

    it "removes the record from the db" do
      delete :destroy, id: @medium.id
      expect(model_type.count).to eq 0
    end

    it "redirects to the medium index page after deleting" do
      delete :destroy, id: @medium.id
      expect(subject).to redirect_to(send(media_path))
    end
  end

  describe "POST #create" do
    let(:medium_params) { { model_symbol => { id: 1, title: "Lord of the Rings", description: "some dude prolly" } } }
    let(:invalid_medium_params) { { model_symbol => { description: "another dude" } } }

    context "Has a title!" do
      it "creates a new record in the db" do
        post :create, medium_params
        expect(model_type.count).to eq 1
      end

      it "redirects to the new record's show page" do
        post :create, medium_params
        expect(subject).to redirect_to(send(medium_path, id: 1))
      end

      it "creates defaults to create a record with a ranking of zero" do
        post :create, medium_params
        expect(model_type.all.first.rank). to eq 0
      end
    end

    context "Does not have a title." do
      it "does not create and save a record without a title" do
        post :create, invalid_medium_params
        expect(model_type.count).to eq 0
      end

      it "renders the edit page" do
        post :create, invalid_medium_params
        expect(subject).to render_template(:new)
      end
    end
  end

end
