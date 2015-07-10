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
    context "valid #{described_class.model} params" do
      let(:params) do
        {
          medium: {
            title: "a title",
            rank: 20,
            description: "a description"
          }
        }
      end

      it "creates a #{described_class.model} record" do
        post :create, params
        expect(described_class.model.count).to eq 1
      end

      it "redirects to the show page" do
        post :create, params
        expect(subject).to redirect_to(polymorphic_path(described_class))
      end

      context "record in which only the title is specified" do
        let(:params) do
          { medium: { title: "a title" } }
        end

        it "creates a record" do
          post :create, params
          expect(described_class.model.count).to eq 1
        end

        it "sets value of rank to 0" do
          post :create, params
          expect(described_class.model.first.rank).to eq 0
        end

        it "redirects to the medium show page" do
          post :create, params
          expect(subject).to redirect_to(polymorphic_path(assigns(:medium)))
        end
      end
    end

    context "invalid params" do
      let(:params) do
        { medium: { description: "a description" } }
      end

      it "does not persist a #{described_class.model} record" do
        post :create, params
        expect(described_class.model.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, params
        expect(response).to render_template("new")
      end
    end
  end
  #
  # describe "PUT update/:id" do
  #   let(:attr) do
  #     { title: "new title",
  #       director: "new director",
  #       description: "new description" }
  #   end
  #
  #   before :each do
  #     @medium = described_class.model.create(title: "a title", director: "an artist", rank: 20, description: "a description")
  #     put :update, :id => @medium.id, :medium => attr
  #     @medium.reload
  #   end
  #
  #   it "updates the medium record" do
  #     expect(response).to redirect_to(@medium)
  #     expect(@medium.title).to eq "new title"
  #     expect(@medium.director).to eq "new director"
  #     expect(@medium.description).to eq "new description"
  #   end
  #
  #   it "redirects to the medium show page" do
  #     expect(subject).to redirect_to(polymorphic_path(assigns(:medium)))
  #   end
  # end
  #
  #
  # describe "GET #show" do
  #   before :each do
  #     @medium = described_class.model.create(title: "a title", director: "an artist", rank: 20, description: "a description")
  #   end
  #
  #   it "shows the selected medium" do
  #     get :show, id: @medium
  #
  #     expect { assigns(:medium).to eq(@medium) }
  #   end
  #
  #   it  "renders the #show template" do
  #     get :show, id: @medium.id
  #     expect(subject).to render_template :show
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   before :each do
  #     @medium = described_class.model.create(title: "a title", director: "an artist", rank: 20, description: "a description")
  #   end
  #
  #   it "deletes the record" do
  #     expect{
  #       delete :destroy, id: @medium
  #     }.to change(described_class.model, :count).by(-1)
  #   end
  #
  #   it "redirects to #{described_class.model}s_path" do
  #     delete :destroy, id: @medium
  #     expect(response).to redirect_to polymorphic_path("#{@medium.downcase}s")
  #   end
  # end
  #
  # describe "PATCH #upvote" do
  #   before :each do
  #     @medium = described_class.model.create(title: "a title", director: "an artist", rank: 20, description: "a description")
  #     patch :upvote, id: @medium
  #     @medium.reload
  #   end
  #
  #   it "increases the rank by 1" do
  #     expect(@medium.rank).to eq 21
  #   end
  #
  #   it "redirects to #{described_class.model}_path" do
  #     patch :upvote, id: @medium
  #     expect(response).to redirect_to polymorphic_path(@medium.id)
  #   end
  # end
end
