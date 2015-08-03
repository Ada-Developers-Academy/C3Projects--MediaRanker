RSpec.shared_examples "medium" do

  describe "GET #index" do
    it "renders the index template" do
      get :index

      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end
  end

  # describe "GET #show" do
  #   it "renders the show template" do
  #     get :show, id: medium.id

  #     expect(response).to have_http_status(200)
  #     expect(response).to render_template("show")
  #   end
  # end

end