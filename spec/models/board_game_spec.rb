require 'rails_helper'

RSpec.describe BoardGame, type: :model do
  it "orders by ranking descending" do
    carcassone = BoardGame.create!(title: "Carcassone", meeples: 12)
    sentinels = BoardGame.create!(title: "Sentinels of the Multiverse", meeples: 24)

    expect(BoardGame.ordered_by_meeples).to eq([sentinels, carcassone])
  end
end
