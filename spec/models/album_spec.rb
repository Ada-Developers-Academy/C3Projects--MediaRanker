require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "validates incoming data" do
    it "requires a name" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:title)
    end
  end

end
