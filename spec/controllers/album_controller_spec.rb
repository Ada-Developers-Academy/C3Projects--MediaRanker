require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe AlbumsController do
    it_behaves_like "a media"
  end
end
