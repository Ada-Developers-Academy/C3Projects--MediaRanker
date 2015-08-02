require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validation" do
    it "requires a name, all the time" do
        album = Album.new

        expect(album).to_not be_valid 
        expect(album.errors.keys).to include(:name)
    end

    it "requires a description, all the time" do
        album = Album.new

        expect(album).to_not be_valid 
        expect(album.errors.keys).to include(:description)
    end 
  end
end
