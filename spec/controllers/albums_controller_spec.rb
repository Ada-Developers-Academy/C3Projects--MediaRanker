require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "a medium controller"
  let(:params) do
    {
      album: {
        title: "a title",
        artist: "an artist",
        description: "a description"
      }
    }
  end

  let(:minimal_params) do
    { album: { title: "a title" } }
  end

  let(:invalid_params) do
    { album: { description: "a description" } }
  end

  let(:medium_name) { :album }
end
