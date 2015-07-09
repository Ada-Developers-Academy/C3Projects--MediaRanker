require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  # shared examples
  describe MoviesController do
    it_behaves_like "medium"
  end
end
