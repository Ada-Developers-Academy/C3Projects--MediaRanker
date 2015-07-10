require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model validation" do
    it "Requires that a name must be entered to create an entry" do
      movie=Movie.new
      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:title)
    end
  end

end
