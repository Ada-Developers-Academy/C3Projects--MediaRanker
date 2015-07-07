require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validations " do
    it "requires a name, all the time" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
      # testing that it's failing b/c title is required
    end
  end
end
