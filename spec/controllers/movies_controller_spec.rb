require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller"
  let(:params) do
    {
      movie: {
        title: "a title",
        director: "a director",
        description: "a description"
      }
    }
  end

  let(:minimal_params) do
    { movie: { title: "a title" } }
  end

  let(:invalid_params) do
    { movie: { description: "a description" } }
  end

  let(:medium_name) { :movie }
end
