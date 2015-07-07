require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "model validations " do
    it "requires a name, all the time" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:name)
      # testing that it's failing b/c title is required
    end
  end
end
