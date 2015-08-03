require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe MoviesController do
    it_behaves_like "a media controller"
  end
end
