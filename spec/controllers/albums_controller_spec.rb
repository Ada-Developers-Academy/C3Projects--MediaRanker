require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like 'a MediaController', Album, :album, :albums_path
end
