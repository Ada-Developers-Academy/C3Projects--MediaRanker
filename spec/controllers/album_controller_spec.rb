require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let (:model) { Album }

    it_behaves_like "a media"
  end

