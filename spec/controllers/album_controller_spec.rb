require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe AlbumsController do
    it_behaves_like "a media"
  end

  describe "POST create" do
    context "valid params" do
      let (:params) do {album: {id: 2, name: "a name", creator: "someone", description: "whatever" }}

      end

      it "creates a new album record" do
        post :create, params

        expect(Album.count).to eq 1
      end

      it "redirects to the album show page" do
        post :create, params

        expect(subject).to redirect_to(album_path(assigns(:album)))
      end
    end

    context "invalid params" do
      let (:params) do {album: {id: 2, creator: "a person", description: "something" }}
      end

      it "does not persist into the database" do
        post :create, params

        expect(Album.count).to eq 0
      end

      it "renders the new action" do
        post :create, params

        expect(response).to render_template("new")
      end
    end
  end
end
