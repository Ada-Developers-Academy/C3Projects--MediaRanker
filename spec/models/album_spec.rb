require 'rails_helper'
require 'support/shared_examples'

RSpec.describe Album do
  it_behaves_like "a book"
end

RSpec.describe Album, type: :model do

  describe ":best scope" do
    before :each do
      @album4 = Album.create(name: "a album", artist: "artist", desc: "desc", vote: 8)
      @album1 = Album.create(name: "b album", artist: "artist", desc: "desc", vote: 4)
      @album3 = Album.create(name: "c album", artist: "artist", desc: "desc", vote: 19)
      @album2 = Album.create(name: "d album", artist: "artist", desc: "desc", vote: 38)
    end

    it "sorts the albums in descending order by # of votes" do
      correct_order = [@album2, @album3, @album4, @album1]
      expect(Album.best(4)).to eq correct_order
    end
  end
end
