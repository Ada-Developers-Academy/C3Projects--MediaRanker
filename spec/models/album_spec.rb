require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model validations" do
    it "requires a name all the time" do
      movie = Movie.new

      expect(movie).to_not be_valid
      expect(movie.errors.keys).to include(:name)
    end
  end

  describe "best scope" do
    it "displays just 10 albums with ranking in desc order" do
      album1  = Album.create(name: "name1",  artist: "artist1", description: "description1", ranking: 1)
      album2  = Album.create(name: "name2",  artist: "artist2", description: "description2", ranking: 2)
      album3  = Album.create(name: "name3",  artist: "artist3", description: "description3", ranking: 3)
      album4  = Album.create(name: "name4",  artist: "artist4", description: "description4", ranking: 4)
      album5  = Album.create(name: "name5",  artist: "artist5", description: "description5", ranking: 5)
      album6  = Album.create(name: "name6",  artist: "artist6", description: "description6", ranking: 6)
      album7  = Album.create(name: "name7",  artist: "artist7", description: "description7", ranking: 7)
      album8  = Album.create(name: "name8",  artist: "artist8", description: "description8", ranking: 8)
      album9  = Album.create(name: "name9",  artist: "artist9", description: "description9", ranking: 9)
      album10 = Album.create(name: "name10", artist: "artist10", description: "description10", ranking: 10)
      album11 = Album.create(name: "name11", artist: "artist11", description: "description11", ranking: 11)
      album12 = Album.create(name: "name12", artist: "artist12", description: "description12", ranking: 12)

      desc_order = [album12, album11, album10, album9, album8, album7, album6, album5, album4, album3]
      expect(Album.best).to eq desc_order
      expect(Album.best.count).to eq 10
    end
  end
end
