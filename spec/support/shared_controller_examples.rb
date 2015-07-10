RSpec.shared_examples "MediaController" do
    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    describe "GET #new" do
      context "valid params" do
        it "creates a new instance of Media" do
          get :new, media_params
          expect(assigns(media)).to be_kind_of(model)
        end
      end

      context "invalid params" do
        it "doesn't instantiate Media with invalid params" do
          get :new, invalid_params
          expect(model.count).to eq 0
        end
      end
    end

    describe "POST #create" do
      context "valid params" do
        it "creates a Media record" do
          post :create, media_params
          expect(model.count).to eq 1
        end

        it "redirects to the show page" do
          post :create, media_params
          expect(subject).to redirect_to(send(media_path, assigns(media)))
        end
      end

      context "invalid params" do
        it "does not persist invalid records" do
          post :create, invalid_params
          expect(model.count).to eq 0
        end

        it "renders the :new view (to allow users to fix invalid data)" do
          post :create, invalid_params
          expect(response).to render_template(:new)
        end
      end
    end

    describe "PATCH #update" do
      before :each do 
        @created = model.create(name: "name")
      end
      
      context "valid params" do
        it "updates an existing record" do
          patch :update, { id: @created.id }.merge(new_params)
          # NOTES TO REMEMBER:
          # put :update, id: @created.id, { book: { name: "title" }}
          # put :update, { id: @created.id, book: { name: "title" } }
          @created.reload
          expect(@created.name).to eq "title"
        end

        it "redirects to the show page" do
          patch :update, { id: @created.id }.merge(new_params)
          @created.reload
          expect(subject).to redirect_to(send(media_path))
        end
      end

      context "invalid params" do
        it "does not persist invalid record updates" do
          patch :update, { id: @created.id }.merge(invalid_params)
          expect(subject).to redirect_to(send(media_path))
        end
      end
    end

    describe "POST #upvote" do
      before :each do 
        @vote_media = model.create(name: "name", vote: 0)
      end

      context "clicking upvote button" do
        it "increases the upvote count by 1" do
          post :upvote, id: @vote_media.id
          @vote_media.reload
          expect(@vote_media.vote).to eq 1
        end

        it "redirects to the show page" do
          patch :upvote, id: @vote_media.id
          @vote_media.reload
          expect(subject).to redirect_to(send(media_path))
        end
      end
    end

    describe "DELETE #destroy" do
      before :each do 
        @delete = model.create(name: "name")
      end

      context "clicking the delete button" do
        it "removes a record" do
          expect {
            delete :destroy, {:id => @delete.id}
            }.to change(model, :count).by(-1)
        end

        it "redirects to the show page" do
          delete :destroy, id: @delete.id
          expect(subject).to redirect_to(send(medias_path))
        end
      end
    end
  end
