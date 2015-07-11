require 'rails_helper'
require 'support/shared_controller_examples'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "MediaController"
  let(:model) { Movie }
end
