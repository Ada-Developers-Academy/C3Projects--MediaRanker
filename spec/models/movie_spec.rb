require 'rails_helper'

RSpec.describe Movie, type: :model do
    describe "model validations" do
      it "requires a title" do
        movie = Movie.new
        expect(movie).to_not be_valid
        expect(movie.errors.keys).to include(:title)
      end

      it "requires an artist" do
        movie = Movie.new
        expect(movie).to_not be_valid
        expect(movie.errors.keys).to include(:author)
      end

      it "has a numerical ranking starting at 1" do
        movie = Movie.new(title: "a title", author: "someone")
        expect(movie.ranking).to eq(1)
      end

      context "error messages" do
        before(:each) do
            @movie = Movie.new(
              title: "dude",
              author: "cool",
              description: "duuude"
              )
        end

        it "gives an error message for updates to blank title and author" do
          @movie.update(title: '', author: '')
          expect(@movie.errors.keys).to include(:title, :author)
        end

      end

    end
  end


end
