require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET movie#index" do

    it "renders the :index view for all Movies" do
       get :index
       expect(response).to render_template("index")
    end


  end
end
