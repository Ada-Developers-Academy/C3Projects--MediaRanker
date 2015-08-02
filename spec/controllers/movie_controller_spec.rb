require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let (:model) { Movie }

  it_behaves_like "a media"
end
