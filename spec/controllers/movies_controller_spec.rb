require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a controller"

  let(:media_params) do
        { movie: {
          name: "Hairy Pooper",
          creator: "Mr. Yuk",
          description: "Everybody poops" }
        }
  end #let

  let(:missing_params) do
        { movie: {

          creator: "Mr. Yuk",
          description: "Everybody poops" }
        }
  end #let

  let(:media_path) {movie_path(Movie.last.id)}

  let(:media) {:movie}
  let(:medias) {:movies}

end
