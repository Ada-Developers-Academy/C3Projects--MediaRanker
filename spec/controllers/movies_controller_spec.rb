require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

   it "routes GET /movies to movies#index" do
    expect(get: '/movies').to route_to('movies#index')
  end

end
