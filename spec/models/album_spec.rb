require 'rails_helper'

RSpec.describe Album, type: :model do 

  describe "model validations" do
    it "requires a name, description, and artist all the time" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:name,:description,:artist)
    end
  end
end
