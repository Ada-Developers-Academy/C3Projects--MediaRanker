require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

    describe MoviesController do
      let (:model) { Movie }

      it_behaves_like "a media"
    end

  describe "PATCH update" do
    before :each do
      @movie1 = Movie.new(id: 1, name: "any old name")
      @movie1.save

    end

    it "updates an existing record" do
      original_name = @movie1.name
      patch :update, id: @movie1.id, movie: { id: 1, name: "A new name" }
      @movie1.reload


      expect(@movie1.name).to_not eq original_name
    end
  end
end
