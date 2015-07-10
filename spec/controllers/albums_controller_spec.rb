require 'rails_helper'
require 'support/shared_controller_examples'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "MediaController"
  let(:model) { Album }
  let(:media) { "album".to_sym }
  let(:media_params) { { album: { name: "name" } } }
  let(:new_params) { { album: { name: "title" } } }
  let(:invalid_media_params) { { album: { desc: "desc" } } }
  let(:media_path) { "album_path" }
  let(:medias_path) { "albums_path" }  
end
