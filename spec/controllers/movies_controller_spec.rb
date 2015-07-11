require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like 'a MediaController', Movie, :movie, :movies_path, :movie_path
end
