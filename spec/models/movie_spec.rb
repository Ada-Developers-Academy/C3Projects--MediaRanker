require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations" do
    it "requires a name" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end
  end

end
