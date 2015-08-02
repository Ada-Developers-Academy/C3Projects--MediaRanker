require 'rails_helper'

RSpec.describe StoryGame, type: :model do
  it "orders by ranking descending" do
    microscope = StoryGame.create!(title: "Monster Hearts", rating: 12)
    fiasco = StoryGame.create!(title: "Final Girl", rating: 24)

    expect(StoryGame.ordered_by_rating).to eq([fiasco, microscope])
  end
end
