require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  # shared examples
  describe AlbumsController do
    it_behaves_like "medium"
  end
end
