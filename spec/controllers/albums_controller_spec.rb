require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "GET #show" do
    it "locates the correct Album" do
      album1 = Album.new(id: 1, title: "a title")
      album1.save
      album2 = Album.new(id: 2, title: "b title")
      album2.save
      params = { id: 2 }

      expect(Album.find(params[:id]).title).to eq("b title")
    end

    it "renders the :show view" do
      album1 = Album.new(id: 1, title: "a title")
      album1.save
      get :show, id: 1
      expect(response).to render_template("show")
    end
  end
end
