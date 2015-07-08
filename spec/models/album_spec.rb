require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "model methods" do
    describe "attributes" do
      [:title, :recorded_by, :votes, :description].each do |method_name|
        it { is_expected.to respond_to method_name}
      end
    end

    describe ".best" do
      before :each do
        @album1 = Album.create({ title: "Puppies Album", recorded_by: "Dog", votes: 10, description: "" })
        @album2 = Album.create({ title: "Kitties Album", recorded_by: "Cat", votes: 9, description: "" })
        @album5 = Album.create({ title: "Fishies Album", recorded_by: "Fish", votes: 0, description: "" })
        @album4 = Album.create({ title: "Llamas Album", recorded_by: "The Llama", votes: 6, description: "" })
        @album3 = Album.create({ title: "Orangutans Album", recorded_by: "Orangutan", votes: 7, description: "" })
        @album6 = Album.create({ title: "Elephants Album", recorded_by: "Elephant", votes: 0, description: "" })
      end

      context "when passed a limit of 2" do
        it "returns top 2 books" do
          expect(Album.best(2)).to include(@album1, @album2)
        end

        it "exludes other books" do
          expect(Album.best(2)).to_not include(@album3, @album4, @album5, @album6)
        end
      end
    end

    describe ".upvote" do
      let(:album){ Album.create({ title: "Puppies Album", recorded_by: "Dog", votes: 10, description: "" }) }

      it "increases the votes by 1" do
        Album.upvote(album)
        expect(album.votes).to eq(11)
      end
    end
  end

  describe "model validations" do
    context "when title is missing" do
      it "does not persist the record" do
        album = Album.new

        expect(album).to_not be_valid
        expect(album.errors.keys).to include(:title)
      end
    end
  end
end
