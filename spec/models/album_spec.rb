require 'rails_helper'

RSpec.describe Album, type: :model do 

  describe "model validations" do
    it "requires a name, description, and artist all the time" do
      album = Album.new

      expect(album).to_not be_valid
      expect(album.errors.keys).to include(:name,:description,:artist)
    end
  end

  describe "best scope" do
    it "ranks all the albums by vote in descending order" do
      album1= Album.create(name:'a', artist:'b', description: 'c', vote:30)
      album2= Album.create(name:'a', artist:'b', description: 'c', vote:3)
      album3= Album.create(name:'a', artist:'b', description: 'c', vote:20)

      right_rank = [album1, album3, album2]

      expect(Album.best(3)).to eq right_rank
    end
  end
end
