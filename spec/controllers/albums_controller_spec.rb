require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
     it "routes GET /albums to albums#index" do
      expect(get: '/albums').to route_to('albums#index')
    end
end
