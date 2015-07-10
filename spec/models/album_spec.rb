require 'rails_helper'

RSpec.describe Album, type: :model do

  describe "model validation" do
    it "Requires that a name must be entered to create an entry" do
      album=Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:title)
    end
  end
end
