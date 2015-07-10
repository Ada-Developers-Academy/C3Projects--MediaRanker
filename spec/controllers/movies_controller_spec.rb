require 'rails_helper'
require 'support/shared_controller_examples'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "MediaController"
  let(:model) { Movie }
  let(:media) { "movie".to_sym }
  let(:media_params) { { movie: { name: "name" } } }
  let(:new_params) { { movie: { name: "title" } } }
  let(:invalid_params) { { movie: { desc: "desc" } } }
  let(:media_path) { "movie_path" }
  let(:medias_path) { "movies_path" }  
end
