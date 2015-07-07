require 'rails_helper'

RSpec.describe Album, type: :model do
describe "model validations" do
  it "requires a name" do
    album = Album.new

    expect(album).to_not be_valid
    expect(album.errors.keys).to include(:name)
    end
  end
end
