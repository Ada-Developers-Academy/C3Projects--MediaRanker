require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  # shared examples
  describe AlbumsController do
    it_behaves_like "a medium controller"
  end
end
