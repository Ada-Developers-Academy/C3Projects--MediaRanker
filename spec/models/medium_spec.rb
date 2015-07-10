require 'rails_helper'

RSpec.describe Medium, type: :model do
  describe "model validations" do
    let(:book) { Medium.new }
    it "requires a name" do

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:name)
    end

    it "requires a description" do

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:description)
    end

    it "requires a creator" do

      expect(book).to_not be_valid
      expect(book.errors.keys).to include(:creator)
    end 
  end

  describe "saving and creating an instance" do
    it "sets votes to 0 upon creation" do
      album = Medium.create(name: "Kiss Land", description: "Debut studio album", creator: "The Weekend")
      expect(album.votes).to eq 0
    end
  end


end
