require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe MoviesController do
    it_behaves_like "a media"
  end
end
