require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

  end

  # GET #show

  # GET #edit

  # PATCH (/put) #update

  # GET #new

  # POST #create
  # context "valid movie params" do
    # let(:movie_params) do
    #   {
    #     movie: {
    #       title: "a title",
    #       label_code: "b label",
    #       format: "c format",
    #       released_year: '1985'
    #     }
    #   }
    # end

  end

  # DELETE #destroy

  # PATCH #upvote


end
