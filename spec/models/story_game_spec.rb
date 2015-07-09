require 'rails_helper'

RSpec.describe StoryGame, type: :model do
  it "orders by ranking descending" do
    microscope = StoryGame.create!(title: "Monster Hearts", note_cards: 12)
    fiasco = StoryGame.create!(title: "Final Girl", note_cards: 24)

    expect(StoryGame.ordered_by_note_cards).to eq([fiasco, microscope])
  end
end
