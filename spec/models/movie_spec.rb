require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "model methods" do
    before :each do
      @movie1 = Movie.create({ title: "Puppies Movie", directed_by: "Dog", votes: 10, description: "" })
      @movie2 = Movie.create({ title: "Kitties Movie", directed_by: "Cat", votes: 9, description: "" })
      @movie5 = Movie.create({ title: "Fishies Movie", directed_by: "Fish", votes: 0, description: "" })
      @movie4 = Movie.create({ title: "Llamas Movie", directed_by: "The Llama", votes: 6, description: "" })
      @movie3 = Movie.create({ title: "Orangutans Movie", directed_by: "Orangutan", votes: 7, description: "" })
      @movie6 = Movie.create({ title: "Elephants Movie", directed_by: "Elephant", votes: 0, description: "" })
    end

    context "with #best(2)" do
      it "returns top 2 movies" do
        expect(Movie.best(2)).to include(@movie1, @movie2)
      end

      it "exludes other movies" do
        expect(Movie.best(2)).to_not include(@movie3, @movie4, @movie5, @movie6)
      end
    end
  end
end
