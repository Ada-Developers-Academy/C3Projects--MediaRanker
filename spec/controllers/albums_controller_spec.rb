require 'rails_helper'
require 'support/shared_examples_for_media_controllers'

RSpec.describe AlbumsController, type: :controller do
  let(:model) { Album }

  it_behaves_like "a MediumController"
end
